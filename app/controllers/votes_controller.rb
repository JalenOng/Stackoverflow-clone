class VotesController < ApplicationController

  # before_filter :set_vote, :only => [:create, :edit, :update, :destroy]
  include SessionsHelper

  def new
    @vote = Vote.new
  end

  def create


    if params[:vote][:answer]
      @source = Answer.find(params[:vote][:answer].to_i)
      @question = @source.question

      voted = Vote.vote_only_once(current_user.id, @source)

    elsif params[:vote][:question]
      @source = Question.find(params[:vote][:question].to_i)
      @question = @source

      voted = Vote.vote_only_once(current_user.id, @source)

    end


    if voted
      redirect_to @question
    else

      @vote = Vote.create(source: @source, user: current_user)

      Question.vote_count(@question.id)

      redirect_to @question
    end




  end

  def destroy

    if params[:vote][:answer]
      @source = Answer.find(params[:vote][:answer].to_i)
      @question = @source.question

    elsif params[:vote][:question]
      @source = Question.find(params[:vote][:question].to_i)
      @question = @source
    end


    vote = @source.votes.first
    # if params[:vote][:question]

    vote.destroy
    redirect_to @question


  end

  private



end
