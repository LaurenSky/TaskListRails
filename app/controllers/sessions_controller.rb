class SessionsController < ApplicationController
  skip_before_action :require_login, only: [:create]

  def index
    @user = User.find(session[:user_id]) # < recalls the value set in a previous request
    redirect_to tasks_path
  end

  def create
    auth_hash = request.env['omniauth.auth']
    redirect_to login_failure_path if auth_hash['uid'].nil?

    @user = User.find_by(uid: auth_hash[:uid], provider: 'google')
    if @user.nil?
      # User doesn't match anything in the DB.
      # Attempt to create a new user.
      @user = User.build_from_google(auth_hash)
      unless @user.save
        render :login_failure
        return
      end
    end

    # Save the user ID in the session
    session[:user_id] = @user.id

    redirect_to sessions_path
  end

  def login_failure

  end

  def destroy
    session.delete(:user_id)
    redirect_to root_path
  end
end
