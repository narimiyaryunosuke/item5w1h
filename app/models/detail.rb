class Detail < ApplicationRecord
  belongs_to :favorite
  
  validates :name, length: { maximum: 100 }
  validates :purchase_date, length: { maximum: 100 }
  validates :place, length: { maximum: 100 }
  validates :person, length: { maximum: 100 }
  validates :reason, length: { maximum: 300 }
  validates :way, length: { maximum: 100 }
  
end
