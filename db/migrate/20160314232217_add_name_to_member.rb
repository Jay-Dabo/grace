class AddNameToMember < ActiveRecord::Migration
  def change
    add_column :members, :name, :string
    add_column :members, :gender, :string
  end
end
