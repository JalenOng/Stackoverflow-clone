class QuestionsController < ApplicationController
    include SessionsHelper
    before_filter :set_question, :only => [:show, :edit, :update, :destroy]


    def index
      @questions = Question.all
    end

    def show
        @comment = Comment.new
        @answer = Answer.new
        @vote = Vote.new
    end

    def new
        @question = Question.new
    end

    def create

        @question = Question.create(title: params[:question][:title], text: params[:question][:text], user: current_user)

        redirect_to questions_url

    end

    def edit

    end

    def update


        @question.update(title: params[:question][:title], text: params[:question][:text], user: current_user)

        redirect_to questions_url

    end


    def destroy
    end

    private
    def set_question
        @question = Question.find(params[:id])
    end

    def question_params
      params.require(:question).permit(:title, :text)
    end
end
