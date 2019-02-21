class TweetController < ApplicationController
  
  def create
    if tweet_service.process == 'ok'
      redirect_to dashboard_path
    end
  end

  private

  def create_params
    params.permit(:tweet)
  end

  def tweet_service
    @tweet_service ||= TweetService.new(create_params[:tweet], current_user)
  end

end