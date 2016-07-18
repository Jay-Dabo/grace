class CreateGivingTypes < ActiveRecord::Migration
  def change
    create_table :giving_types do |t|
      t.string :type
      t.references :church, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
