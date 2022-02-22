class AddParentIdToTweet < ActiveRecord::Migration[6.1]
  def change
    add_column :tweets, :parent_id, :integer
    add_index :tweets, :parent_id
  end
end