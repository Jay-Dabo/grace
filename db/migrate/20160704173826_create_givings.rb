class CreateGivings < ActiveRecord::Migration[5.2]
  def change
    create_table :givings do |t|

      t.timestamps null: false
    end
  end
end
