class AddBranchManagerToUsers < ActiveRecord::Migration
  def change
  	add_column :users, :branch_manager, :boolean, default: false
  end
end
