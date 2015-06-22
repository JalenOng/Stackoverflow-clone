class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :source, polymorphic: true
  has_many :votes, as: :source

end
