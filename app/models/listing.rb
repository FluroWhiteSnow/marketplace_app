class Listing < ApplicationRecord
    belongs_to :user
    has_many_attached :images  
    has_one :purchase, dependent: :destroy

    validates :title, :price, presence: true

end
