class StaticPagesController < ApplicationController

  def home
    find_hashtags
    parse_hashtags
  end

  def tweets
    get_tweets
    respond_to do |format|
      format.json do
        render json: @tweets.to_json, callback: params[:callback], data_type: 'jsonp'
      end
    end
  end


  private

    def get_tweets
      @tweets ||= $twitter.search("#portland -rt")
    end

    def find_hashtags
      get_tweets
      @hashtags = [];
      @tweets.each do |tweet|
        tweet.hashtags.each do |hashtag|
          @hashtags.push hashtag
        end
      end
      @hashtags
    end

    def parse_hashtags
      find_hashtag_occurence
      @hashtags_by_amount.sort_by { |_key, value| value}
    end

    def find_hashtag_occurence
      @hashtags_by_amount = {}
      @hashtags.each do |hashtag|
        if !hastags_by_amount.keys.include?(hashtag)
          @hashtags[hashtag] += 1
        else
          @hashtags[hashtag] = 1
        end
      end
    end
end
