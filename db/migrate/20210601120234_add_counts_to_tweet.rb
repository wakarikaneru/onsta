class AddCountsToTweet < ActiveRecord::Migration[6.1]
  def change
    add_column :tweets, :res_count, :integer
    add_column :tweets, :tirami_count, :integer
  end
end
