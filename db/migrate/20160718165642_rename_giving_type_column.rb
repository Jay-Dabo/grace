class RenameGivingTypeColumn < ActiveRecord::Migration
  def change
    rename_column :giving_types, :type, :giving_type
  end
end
