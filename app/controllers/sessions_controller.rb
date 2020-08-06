class SessionsController < ApplicationController
  before_action :authorized, only: [:welcome]

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
    @next_events = current_user.attended_events.upcoming_events
    @prev_events = current_user.attended_events.previous_events
  end

  def destroy
   session[:user_id] = nil
   redirect_to root_path, notice: 'Logged Out!'
  end
end
