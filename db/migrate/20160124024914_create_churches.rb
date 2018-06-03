class CreateChurches < ActiveRecord::Migration[5.2]
  def change
    create_table :churches do |t|
      t.string :name
      t.string :denomination
      t.string :church_image

      t.timestamps null: false
    end
  end
end
