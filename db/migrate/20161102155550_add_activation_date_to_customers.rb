class AddActivationDateToCustomers < ActiveRecord::Migration
  def change
  	add_column :customers, :activation_date, :string
  end
end
