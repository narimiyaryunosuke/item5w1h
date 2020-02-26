class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         
  mount_uploader :image, ImageUploader
  
  has_many :items, dependent: :destroy, through: :favorites
  has_many :favorites, dependent: :destroy
  has_many :fav_items, through: :favorites, source: :item
  
  def fav(item)
    favorites.find_or_create_by(item_id: item.id)
  end
  
  def unfav(item)
    favorites.find_by(item_id: item.id).destroy
  end
  
  def fav?(item)
    self.fav_items.include?(item)
  end


end
