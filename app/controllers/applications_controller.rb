class ApplicationsController < ApplicationController

  def auth
    if params[:request_type] && params[:username] && params[:token]
      if app_check? && user_exists?
        user = User.find_by(username: params[:username])
        if params[:request_type] == 'restaurants_json'
          @output = user.restaurant_info.to_json
        elsif params[:request_type] == 'restaurants_xml'
          @output = user.restaurant_info.to_xml
        elsif params[:request_type] == 'items_json'
          @output = user.item_info.to_json
        elsif params[:request_type] == 'items_xml'
          @output = user.item_info.to_xml
        else
          @output = 'That request type is not valid.'
        end
        render 'index'
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
