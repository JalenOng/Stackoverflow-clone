class CommentsController < ApplicationController
  before_filter :set_comment, :only => [:show, :edit, :update, :destroy]
  include SessionsHelper



  def new
    @comment = Comment.new
  end

  def create

    @question = Question.find(params[:comment][:question].to_i)

    @comment = Comment.create(text: params[:comment][:text], source: @question, user: current_user)

    redirect_to @question
  end

  private

  def set_comment
    @comment = Comment.find(params[:id])
  end
end



# create_table "comments", force: true do |t|
#   t.text     "text"
#   t.integer  "source_id"
#   t.string   "source_type"
#   t.integer  "user_id"
#   t.datetime "created_at"
#   t.datetime "updated_at"