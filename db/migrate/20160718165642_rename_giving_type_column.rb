class RenameGivingTypeColumn < ActiveRecord::Migration[5.2]
  def change
    rename_column :giving_types, :type, :giving_type
  end
end
