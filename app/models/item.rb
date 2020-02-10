class Item < ApplicationRecord
  validates :code, presence: true
  validates :name, presence: true
  validates :price, presence: true
  validates :url, presence: true
  validates :image_url, presence: true
  
  has_many :favorites, dependent: :destroy
  
  

end
