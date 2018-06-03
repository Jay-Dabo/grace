class AddEmailToMembers < ActiveRecord::Migration[5.2]
  def change
    add_column :members, :email, :string
    add_column :members, :phone, :string
    add_column :members, :member_image, :string
    add_column :members, :birthday, :date
    add_column :members, :address, :string
    add_column :members, :city, :string
    add_column :members, :state, :string
    add_column :members, :postal_code, :string
    add_column :members, :last_name, :string
    add_column :members, :interest, :text
  end
end
