class VotesController < ApplicationController

  before_filter :set_vote, :only => [:show, :edit, :update, :destroy]
  include SessionsHelper

  def new
    @vote = Vote.new
  end

  def create

    @question = Question.find(params[:answer][:question].to_i)

    @answer = Answer.create(text: params[:answer][:text], question: @question, user: current_user)


    redirect_to @question

  end

  def destroy


  end


end
