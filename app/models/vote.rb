class Vote < ActiveRecord::Base
  belongs_to :user
  belongs_to :source, polymorphic: true

  def self.vote_only_once(user_id, source)
      @vote = Vote.where(user_id: user_id, source: source).first
      if @vote.present?
        return true

      else
        return false
      end
  end

end
