class StaticPagesController < ApplicationController

  def home
    @hashtags = Hashtag.first(40)
  end
end
