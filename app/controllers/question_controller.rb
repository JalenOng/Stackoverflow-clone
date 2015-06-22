class QuestionController < ApplicationController

    before_filter :set_question, :only => [:show, :edit, :update, :destroy]

    def index
      @questions = Question.all
    end


    private
    def set_question

    end

    def question_params
      params.require(:question).permit(:title, :text)
    end
end
