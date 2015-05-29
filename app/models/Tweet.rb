class Tweet < ActiveRecord::Base
  has_many :hashtags
end
