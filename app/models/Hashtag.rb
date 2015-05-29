class Hashtag < ActiveRecord::Base
  belongs_to :tweet

  default_scope { order('occurences DESC') }
end
