class Answer < ApplicationRecord

	has_many :comments, as: :commentable
	has_many :votes, as: :votable
  belongs_to :user
  belongs_to :question
  
  validates :body, :user_id, :question_id, presence: true
  
end
