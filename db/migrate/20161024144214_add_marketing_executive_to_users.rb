class AddMarketingExecutiveToUsers < ActiveRecord::Migration
  def change
  	add_column :users, :marketing_executive, :boolean, default: false
  	add_column :users, :tele_caller, :boolean, default: false
  	add_column :users, :technician, :boolean, default: false
  end
end
