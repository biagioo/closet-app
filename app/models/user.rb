class User < ActiveRecord::Base 
    has_many :items
    has_secure_password
    validates :email, :username, uniqueness: true
    validates :email, :username, presence: true
end