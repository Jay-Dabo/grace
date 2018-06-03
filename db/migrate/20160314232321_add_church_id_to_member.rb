class AddChurchIdToMember < ActiveRecord::Migration[5.2]
  def change
    add_column :members, :church_id, :integer
  end
end
