class CreateHashtags < ActiveRecord::Migration
  def change
    create_table :hashtags do |t|
      t.integer :tweet_id
      t.string :tag
    end
  end
end
