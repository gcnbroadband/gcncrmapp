class AddAppIdToCustomers < ActiveRecord::Migration
  def change
  	add_column :customers, :app_id, :string
  end
end
