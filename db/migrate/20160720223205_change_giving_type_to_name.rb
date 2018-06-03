class ChangeGivingTypeToName < ActiveRecord::Migration[5.2]
  def change
    rename_column :giving_types, :giving_type, :name
  end
end
