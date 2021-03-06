class Vote < ApplicationRecord
  
  belongs_to :user
  belongs_to :votable, polymorphic: true    
  # has_many :votes, as: :votable

  validates_uniqueness_of :user_id, :scope => [:votable_id, :votable_type]

end
