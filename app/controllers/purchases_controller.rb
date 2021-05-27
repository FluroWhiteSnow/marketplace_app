class PurchasesController < ApplicationController
    
    skip_before_action :verify_authenticity_token, only:[:webhook]
    
    def success
        @listing = Listing.find(params[:listingId])
    end

    # Webhook allowing for information to be present after stripe payment completed
    #Allows for items to be deleted from database after transaction
    def webhook
        payment_intent_id = params[:data][:object][:payment_intent]
        payment = Stripe::PaymentIntent.retrieve(payment_intent_id)
        listing_id = payment.metadata.listing_id
        buyer_id = payment.metadata.user_id

        Purchase.create(user_id: buyer_id, 
            listing_id: listing_id, 
            payment_intent_id: payment_intent_id, 
            receipt_url: payment.charges.data[0] 
        )

        listing = Listing.find(listing_id)
        listing.update(status: 'purchased')
    end
end
