class CreatePurchases < ActiveRecord::Migration[6.1]
  def change
    create_table :purchases do |t|
      t.bigint :listing_id
      t.bigint :user_id
      t.string :receipt_url
      t.string :payment_intent_id

      t.timestamps
    end
  end
end
