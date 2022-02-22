class AddResNumberToTweet < ActiveRecord::Migration[6.1]
  def change
    add_column :tweets, :res_number, :integer
  end
end
