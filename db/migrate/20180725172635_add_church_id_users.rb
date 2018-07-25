class AddChurchIdUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :church_id, :integer
  end
end
