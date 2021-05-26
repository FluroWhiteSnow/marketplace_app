class ListingsController < ApplicationController

  # before_action :set_listing, only: [:show, :edit, :update, :destroy]

  def index
    @listings = Listing.includes(:user).with_attached_images

  end

  def show
    @listing = Listing.find(params[:id])
    session = Stripe::Checkout::Session.create(
      payment_method_types: ['card'],
      customer_email: "anrodziewiczz@gmail.com",
      line_items: [{
        name: @listing.title,
        description: @listing.description,
        amount: (@listing.price * 100),
        currency: 'aud',
        quantity: 1,
        images: @listing.images.empty? ? nil : [@listing.images.first.service_url]
      }],
      payment_intent_data: {
        metadata: {
          listing_id: @listing.id,
          user_id: current_user ? current_user.id : nil
        }
      },
      success_url: "#{root_url}purchases/success?listingId=#{@listing.id}",
      cancel_url: "#{root_url}"
    )
    @session_id = session.id
  end

  def new
    @listing = Listing.new
  end
  
  def create
    @listing = Listing.new(listing_params)
    @user = current_user
    @listing.user = @user
    if @listing.save
      redirect_to listing_path(@listing)
    else
      render :new
    end
  end

  def edit
    @listing = Listing.find(params[:id])
  end

  def update
    @listing = Listing.find(params[:id])
    @listing.update(listing_params)
    redirect_to listing_path(@listing)
  end

  def destroy
    @listing=Listing.find(params[:id])
    @listing.destroy

    flash.notice="Listing '#{@listing.title}' was deleted"
    redirect_to listings_path
  end

  private 

  def set_listing
    @listing = Listing.find(params[:listing_id])
  end

  def listing_params 
    params.require(:listing).permit(:title, :price, :description, images: [])
  end

end
