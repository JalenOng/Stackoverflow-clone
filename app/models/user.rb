class User < ActiveRecord::Base
  has_many :questions
  has_many :answers
  has_many :comments
  has_many :votes

 def self.authenticate(username, password)

     @user = User.where(username: username, password: password).first
     # if email and password correspond to a valid user, return that user
     if @user.present?
       @user
     # otherwise, return nil
     else
       nil
     end
 end
end
