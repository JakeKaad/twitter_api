class StaticPagesController < ApplicationController

  def home
    @tweets = $twitter.search("#portland -rt")
    render json: @tweets
  end

end
