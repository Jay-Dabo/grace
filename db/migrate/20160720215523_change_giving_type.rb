class ChangeGivingType < ActiveRecord::Migration
  def change
    rename_column :givings, :giving_type, :giving_type_id
    change_column :givings, :giving_type_id, :integer
  end
end
