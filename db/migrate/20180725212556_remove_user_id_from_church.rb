class RemoveUserIdFromChurch < ActiveRecord::Migration[5.2]
  def change
    remove_column :churches, :user_id
  end
end
