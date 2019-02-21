class Auth::SignupController < ApplicationController

  before_action :verify_user_logged_in

  def new
  end

  def create
    if signup_service.process == 'ok'
      create_user_cookie({name: params[:name],surname: params[:surname], email: params[:email]})
      redirect_to dashboard_path
    else
      redirect_back(fallback_location: auth_signup_path)
    end
  end

  private

  def create_params
    params.permit(:name, :surname, :email, :email_confirm, :password, :password_confirm)
  end

  def signup_service
    @signup_service ||= Auth::SignupService.new(create_params)
  end

end