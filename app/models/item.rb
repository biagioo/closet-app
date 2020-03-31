class Item < ActiveRecord::Base 
belongs_to :user
validates :brand, :clothing_type, :size, presence: true
end