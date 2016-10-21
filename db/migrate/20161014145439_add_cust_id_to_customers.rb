class AddCustIdToCustomers < ActiveRecord::Migration
  def change
  	add_column :customers, :cust_id, :string
  end
end
