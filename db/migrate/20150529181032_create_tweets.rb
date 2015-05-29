class CreateTweets < ActiveRecord::Migration
  def change
    create_table :tweets do |t|
      t.string :tweet_id
      t.datetime :tweeted_at
      t.string :text
      t.string :user
      t.string :user_url
      t.string :user_image_url

      t.timestamps
    end
  end
end
