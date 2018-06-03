class AddChurchIdToGiving < ActiveRecord::Migration[5.2]
  def change
    add_column :givings, :church_id, :integer
  end
end
