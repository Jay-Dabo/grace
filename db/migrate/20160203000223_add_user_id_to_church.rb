class AddUserIdToChurch < ActiveRecord::Migration
  def change
    add_column :churches, :user_id, :integer
  end
end
