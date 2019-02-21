class DashboardController < ApplicationController
  before_action :verify_user_not_logged_in

  def index
    current_user

    @tweets = current_user.tweets.order(created_at: :desc)
  end
  
end