class AddUserIdToChurch < ActiveRecord::Migration[5.2]
  def change
    add_column :churches, :user_id, :integer
  end
end
