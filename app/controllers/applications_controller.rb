class ApplicationsController < ApplicationController

  def index
    redirect_to :root
  end

  def auth
    if params[:request_type] && params[:password] && params[:username] && params[:token]
      if app_check? && user_exists? && user_auth?
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
          @message = 'That request type is not valid.'
        end
      else
        @message = 'Check info. Either token or username invalid.'
      end
    elsif params[:password] && params[:username] && params[:token]
      if app_check? && user_exists? && user_auth?
        @message = 'User authentication successful.'
      else
        @message = 'User authentication failed.'
      end
    elsif params[:username] && params[:token]
      if app_check? && user_exists?
        @message = "#{params[:username]} is a valid user."
      else
        @message = "#{params[:username]} is not a valid user."
      end
    elsif params[:token]
      if app_check?
        @message = 'Your auth_token is valid.'
      else
        @message = 'Your auth_token is invalid.'
      end
    else
      @message = nil
    end
    render 'index'
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
