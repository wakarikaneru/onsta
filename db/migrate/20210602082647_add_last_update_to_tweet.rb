class AddLastUpdateToTweet < ActiveRecord::Migration[6.1]
  def change
    add_column :tweets, :last_update, :datetime
  end
end
