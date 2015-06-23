class Answer < ActiveRecord::Base
  belongs_to :user
  belongs_to :question
  has_many :comments, as: :source
  has_many :votes, as: :source


  def self.one_best(question_id)

    question = Question.find(question_id)
    best = question.answers.where(best: true)

    byebug
    if best == []
      false
    else
      true
    end


  end


end
