class CreateGivings < ActiveRecord::Migration
  def change
    create_table :givings do |t|

      t.timestamps null: false
    end
  end
end
