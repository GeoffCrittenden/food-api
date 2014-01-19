class ApplicationsController < ApplicationController

  def auth
    if app_check?
      render 'valid-app'
    else
      render 'invalid-app'
    end 
  end

  def user_check
    if app_check?
      if user_exists?
        render 'valid-user'
      else
        render 'invalid-user'
      end
    else
      render 'invalid-app'
    end    
  end

  def user_exists?
    user = User.find_by(username: params[:username])
    if user
      return true
    end
    false
  end

  def app_check?
    app = Application.find_by(auth_token: params[:token])
    if app
      return true
    end
    false
  end

end
