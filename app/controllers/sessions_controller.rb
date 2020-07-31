class SessionsController < ApplicationController
  #skip_before_action :authorized, only: [:new, :create, :welcome]

  def new
   #@session = Session.new
  end

  def create
   @user = User.find_by(username: params[:username])
   if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      redirect_to '/welcome'
   else
      redirect_to '/login'
   end
  end

  def login
  end

  def welcome
    @events = Event.all
    @user = User.find_by(username: params[:username])
  end

  def destroy
   session[:user_id] = nil
   redirect_to root_path, notice: 'Logged Out!'
  end
end
