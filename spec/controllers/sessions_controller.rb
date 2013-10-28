class SessionsController < ApplicationController
  def create
    user = User.where(username: params[:username]).first
    session[:user_id] = user.id
    redirect_to todos_path
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path
  end
end
