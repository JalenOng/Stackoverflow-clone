class Question < ActiveRecord::Base
  has_many :comments, as: :source
  has_many :votes, as: :source
  belongs_to :user
  has_many :answers
end
