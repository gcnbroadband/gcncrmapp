class AddServerNameToCustomers < ActiveRecord::Migration
  def change
  	add_column :customers, :server_name, :string
  end
end
