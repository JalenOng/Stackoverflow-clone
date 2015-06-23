class Question < ActiveRecord::Base
  has_many :comments, as: :source
  has_many :votes, as: :source
  belongs_to :user
  has_many :answers

  def self.vote_count(question_id)

    question = Question.find(question_id)
    question.update(vote_count: question.votes.count)
  end

  def self.trending

    questions = Question.all
    questions.each do |q|
      q.update(trending: q.answers.where(created_at: (Time.now - 1.hour)..Time.now).count)
   end

  end

end
