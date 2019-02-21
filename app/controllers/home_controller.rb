class HomeController < ApplicationController
  before_action :verify_user_logged_in

  def index
    redirect_to auth_login_path
  end

end
