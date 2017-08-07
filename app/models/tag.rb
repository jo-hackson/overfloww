class Tag < ApplicationRecord

	has_many :questiontags
	has_many :questions, through: :questiontags

	validates :name, presence: { message: "Must have a name! __JJ" }
	
end
