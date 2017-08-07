class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

	has_many :questions
	has_many :answers
	has_many :comments
	has_many :votes

	validates :first_name, :last_name, :username, :email, presence: true
	validates :email, :username, uniqueness: true

	# def self.find_for_facebook_oauth(auth)
	# 	where(auth.slice(:provider, :uid)).first_or_initialize.tap do |user|
	# 	user.provider = auth.provider
	# 	user.uid = auth.uid
	# 	user.email = auth.info.email
	# 	user.password = Devise.friendly_token[0,20]
	# 	#user.name = auth.info.name   # assuming the user model has a name
	# 	#user.image = auth.info.image # assuming the user model has an image
	# 	user.save!
	# end

end
