class AnswersController < ApplicationController
  before_filter :set_answer, :only => [:show, :edit, :update, :destroy]
  include SessionsHelper

def new
  @answer = Answer.new
end

def create

  @question = Question.find(params[:answer][:question].to_i)

  @answer = Answer.create(text: params[:answer][:text], question: @question, user: current_user)


  redirect_to @question

end



  def set_answer
    @answer = Answer.find(params[:id])
  end
end
