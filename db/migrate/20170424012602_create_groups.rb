class CreateGroups < ActiveRecord::Migration[5.2]
  def change
    create_table :groups do |t|
      t.string :name
      t.text :description
      t.string :group_image
      t.integer :church_id

      t.timestamps null: false
    end
  end
end
