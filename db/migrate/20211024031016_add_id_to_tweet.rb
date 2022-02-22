class AddIdToTweet < ActiveRecord::Migration[6.1]
  def change
    add_column :tweets, :kakikomi_id_mana, :string
    add_column :tweets, :kakikomi_id_disp, :string
    add_column :tweets, :ip_addr, :string
  end
end
