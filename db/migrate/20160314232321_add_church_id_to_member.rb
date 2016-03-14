class AddChurchIdToMember < ActiveRecord::Migration
  def change
    add_column :members, :church_id, :integer
  end
end
