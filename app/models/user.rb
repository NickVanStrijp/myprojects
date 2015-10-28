class User < ActiveRecord::Base
    before_save { self.user_email = user_email.downcase } 
   validates :user_first_name, presence: true, length: {maximum: 50} 
   validates :user_last_name, presence: true, length: {maximum: 50} 
   validates :user_email, presence: true, length: {maximum: 255} 
   validates :user_nnumber, presence: true, length: {maximum: 8} 
   VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i 
   validates :user_email, presence: true, format: { with: VALID_EMAIL_REGEX }, uniqueness: {case_sensitive: false} 
   VALID_NNUMBER_REGEX = /\A[n]\d\d\d\d\d\d\d\z/i
   validates :user_nnumber, presence: true, format: { with: VALID_NNUMBER_REGEX }, uniqueness: {case_sensitive: false}
   
   has_secure_password 
   validates :password, presence: true, length: { minimum: 6 }
   
    has_and_belongs_to_many :projects 
    has_many :tasks 
end

