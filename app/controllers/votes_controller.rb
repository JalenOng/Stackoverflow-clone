class VotesController < ApplicationController

  before_filter :set_vote, :only => [:show, :edit, :update, :destroy]
  include SessionsHelper

  def new
    @vote = Vote.new
  end

  def create


    if params[:vote][:question]


    @question = Question.find(params[:vote][:question].to_i)

    end

    @vote = Vote.create(source: @question, user: current_user)


    redirect_to @question

  end

  def destroy
    vote = Vote.first
    vote.destroy
    redirect_to @question

  end


end
