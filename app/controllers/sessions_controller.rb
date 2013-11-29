class SessionsController < ApplicationController
  def new
    redirect_to home_path if current_user
  end

  def create
    user = User.where(email: params[:email]).first
    if user && user.authenticate(params[:password])
      if user.active?
        session[:user_id] = user.id
        redirect_to home_path, notice: 'you are signed in at your own risk!!'
      else
        flash[:error] = "your account has been suspended, please contact customer service"
        redirect_to sign_in_path
      end
    else
      flash[:error] = "invalid email or password"
      redirect_to sign_in_path
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path, notice: "laytazz .. you are signed out."
  end
end
