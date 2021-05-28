class Listing < ApplicationRecord
    belongs_to :user
    has_many_attached :images  
    has_one :purchase, dependent: :destroy

    validates :title, :price, presence: true
    #sets default status of listing to 1, and allows item status to be purchased
    enum status: { active: 1, inactive: 2, purchased: 3 }
    scope :active, -> { where(status: 1) }
    after_initialize :set_default_status

    def set_default_status
    self.status ||= 1
    end

end
