class AddGcnAdminToUsers < ActiveRecord::Migration
  def change
    add_column :users, :gcn_admin, :boolean, default: false
  end
end