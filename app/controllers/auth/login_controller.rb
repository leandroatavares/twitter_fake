class Auth::LoginController < ApplicationController

  before_action :verify_user_logged_in, :except => [:delete]

  def new
  end

  def create
    if login_service.process == 'ok'
      create_user_cookie({name: find_user[:name],surname: find_user[:surname], email: find_user[:email]})
      redirect_to dashboard_path
    else
      redirect_back(fallback_location: auth_login_path)
    end
  end

  def delete
    delete_user_cookie
    redirect_to root_path
  end

  private

  def create_params
    params.permit(:email, :password)
  end

  def login_service
    @login_service ||= Auth::LoginService.new(create_params)
  end

  def find_user
    @find_user ||= User.find_by(email: create_params[:email])
  end
end