class User < ActiveRecord::Base
    attr_accessor :remember_token
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
   
   def User.digest(string)
        
        cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
                                                  BCrypt::Engine.cost
        BCrypt::Password.create(string, cost: cost)
   end
   
   #Returns a new token
   def User.new_token
      SecureRandom.urlsafe_base64
   end
   
   #Remembers a user in the database for use in persistent sessions.
   def remember 
      self.remember_token = User.new_token
      update_attribute(:remember_digest, User.digest(remember_token))
   end
   #Returns true if the given token matches the digest
   def authenticated?(remember_token)
       return false if remember_digest.nil?
       BCrypt::Password.new(remember_digest).is_password?(remember_token)
   end
    has_and_belongs_to_many :projects 
    has_many :tasks 
    
    def forget
        update_attribute(:remember_digest, nil)
    end
end

