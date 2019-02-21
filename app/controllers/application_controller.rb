class ApplicationController < ActionController::Base

  before_action :build_header

  def create_user_cookie(value)
    cookies.permanent[:user] = value.to_s
  end

  def get_user_cookie
    eval(cookies[:user])
  end

  def delete_user_cookie
    cookies.delete :user
  end

  def user_cookie?
    cookies[:user].present?
  end

  def user_logged_in?
    user_cookie?
  end

  def user_not_logged_in?
    !user_cookie?
  end

  def verify_user_logged_in
    if user_logged_in?
      redirect_to dashboard_path
    end
  end

  def verify_user_not_logged_in
    if !user_logged_in?
      redirect_to root_path
    end
  end

  def build_header
    user_logged_in? ? @header = "logged" : @header = "not_logged"
  end

  def current_user
    @user ||= User.find_by(email: get_user_cookie[:email])
  end
  
end
