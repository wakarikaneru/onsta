class AddIndexToTweets < ActiveRecord::Migration[6.1]
  def change
    add_index :tweets, :user_id
    add_index :tweets, :created_at
    add_index :tweets, :updated_at
  end
end
