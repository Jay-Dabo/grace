class AddFieldsToSubscription < ActiveRecord::Migration[5.2]
  def change
    add_column :subscriptions, :plan_id, :string
    add_column :subscriptions, :charge_amount, :integer
  end
end
