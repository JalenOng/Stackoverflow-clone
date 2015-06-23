class AnswersController < ApplicationController
  before_filter :set_answer, :only => [:show, :edit, :update, :destroy,]
  include SessionsHelper

  def new
    @answer = Answer.new
  end

  def create

    @question = Question.find(params[:answer][:question].to_i)

    @answer = Answer.create(text: params[:answer][:text], question: @question, user: current_user)


    redirect_to @question

  end

  def edit

  end

  def update

    @question = Question.find(params[:answer][:question].to_i)

    @answer.update(text: params[:answer][:text], question: @question, user: current_user)

    redirect_to


  end

  def display_best

   @user = current_user
   @questions = current_user.questions


  end

  def set_best

    @answer = Answer.find(params[:answer][:answer])

    byebug
    @question = @answer.question

    if Answer.one_best(@question.id)
      redirect_to best_path
    else
      @answer.update(best: true)
      byebug
      redirect_to best_path
    end

  end

  def set_answer
    @answer = Answer.find(params[:id])
  end
end
