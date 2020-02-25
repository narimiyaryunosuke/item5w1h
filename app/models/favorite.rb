class Favorite < ApplicationRecord
  belongs_to :user
  belongs_to :item
  
  has_one :detail, dependent: :destroy
  validates :user_id, presence: true,  uniqueness: { scope: :item_id } 
 
end
