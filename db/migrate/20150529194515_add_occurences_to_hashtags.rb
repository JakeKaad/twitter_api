class AddOccurencesToHashtags < ActiveRecord::Migration
  def change
    add_column :hashtags, :occurences, :integer
  end
end
