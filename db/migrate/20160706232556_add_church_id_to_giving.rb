class AddChurchIdToGiving < ActiveRecord::Migration
  def change
    add_column :givings, :church_id, :integer
  end
end
