class Question < ApplicationRecord

	has_many :questiontags
	has_many :tags, through: :questiontags
	has_many :comments, as: :commentable
	has_many :votes, as: :votable
	has_many :answers
  belongs_to :user

  validates :title, :body, :user_id, presence: true
  
end
