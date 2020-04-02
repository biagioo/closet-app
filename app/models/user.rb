class User < ActiveRecord::Base 
    has_many :items
    has_secure_password
    validates :username, uniqueness: true
    validates :email, :username, presence: true
    validates_format_of :email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i, :on => :create
end