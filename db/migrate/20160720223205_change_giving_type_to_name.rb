class ChangeGivingTypeToName < ActiveRecord::Migration
  def change
    rename_column :giving_types, :giving_type, :name
  end
end
