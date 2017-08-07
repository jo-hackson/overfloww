class User < ApplicationRecord

	has_many :questions
	has_many :answers
	has_many :comments
	has_many :votes

	validates :first_name, :last_name, :username, :password_hash, :email, presence: true
  	validates :email, :username, uniqueness: true

	def password
	  @password ||= BCrypt::Password.new(password_hash)
	end

	def password=(entered_password)
	  @password = BCrypt::Password.create(entered_password)
	  self.password_hash = @password
	end

	def authenticate(plain_text_password)
	  self.password == plain_text_password
	end
end
