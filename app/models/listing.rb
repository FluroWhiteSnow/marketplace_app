class Listing < ApplicationRecord
    belongs_to :user
    
    has_one :purchase, dependent: :destroy
    validates :name, :price, :status, presence: true
end
