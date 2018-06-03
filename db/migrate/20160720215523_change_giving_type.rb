class ChangeGivingType < ActiveRecord::Migration[5.2]
  def change
    rename_column :givings, :giving_type, :giving_type_id
    change_column :givings, :giving_type_id, 'integer USING CAST(giving_type_id AS integer)'
  end
end
