class CreateSubscriptions < ActiveRecord::Migration[5.2]
  def change
    create_table :subscriptions do |t|
      t.references :church, foreign_key: true
      t.string :subscription_id
      t.string :customer_id

      t.timestamps
    end
  end
end
