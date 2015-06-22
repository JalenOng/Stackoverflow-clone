class SessionsController < ApplicationController
  include SessionsHelper

  def new

  end

  def create
    @user = User.authenticate(params[:session][:username], params[:session][:password])
       if @user
         # Log the user in and redirect to the user's show page.
         log_in(@user)

         redirect_to questions_url

       else
         flash[:danger] = 'Invalid email/password combination' # Not quite right!
         render 'new'
       end
  end


  def destroy
    log_out
    redirect_to root_url

  end
end
