require 'bcrypt'

class User < ApplicationRecord 
  has_many :tweets

  has_secure_password

  validates :name, presence:true
  validates :email, presence:true, uniqueness:true
end