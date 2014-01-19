class ApplicationsController < ApplicationController

  def auth
    if params[:request_type] && params[:password] && params[:username] && params[:token]
      if app_check? && user_exists? && user_auth?
        if params[:request_type] == 'restaurants_json'
          user = User.find_by(username: params[:username])
          @output = user.restaurants_info.to_json
        elsif params[:request_type] == 'restaurants_xml'
          render index
        end
      end
    elsif params[:password] && params[:username] && params[:token]
      if app_check? && user_exists? && user_auth?
        render 'user-auth-good'
      else
        render 'user-auth-fail'
      end
    elsif params[:username] && params[:token]
      if app_check? && user_exists?
        render 'valid-user'
      else
        render 'invalid-user'
      end
    elsif params[:token]
      if app_check?
        render 'valid-app'
      else
        render 'invalid-app'
      end
    else
      render index
    end
  end

  def app_check?
    app = Application.find_by(auth_token: params[:token])
    if app
      return true
    end
    false
  end

  def user_auth?
    return true if User.find_by(username: params[:username]).try(:authenticate, params[:password])
    false
  end

  def user_exists?
    user = User.find_by(username: params[:username])
    if user
      return true
    end
    false
  end

end
