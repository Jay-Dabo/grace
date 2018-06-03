class AddNameToMember < ActiveRecord::Migration[5.2]
  def change
    add_column :members, :name, :string
    add_column :members, :gender, :string
  end
end
