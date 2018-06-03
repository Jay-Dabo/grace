class ChangeNameInMembers < ActiveRecord::Migration[5.2]
  def change
    rename_column :members, :name, :first_name
  end
end
