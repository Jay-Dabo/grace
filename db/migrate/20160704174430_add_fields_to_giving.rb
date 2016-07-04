class AddFieldsToGiving < ActiveRecord::Migration
  def change
    add_column :givings, :member_id, :integer
    add_column :givings, :amount, :decimal
    add_column :givings, :date_given, :date
    add_column :givings, :giving_type, :string
  end
end
