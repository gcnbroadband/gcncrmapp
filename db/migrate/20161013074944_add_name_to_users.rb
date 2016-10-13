class AddNameToUsers < ActiveRecord::Migration
  def change
  	add_column :users, :name, :string
  	add_column :users, :emp_id, :string
  	add_column :users, :emp_official_mobile_no, :string
  	add_column :users, :emp_official_email, :string
  	add_column :users, :emp_local_addr, :text
  	add_column :users, :date_of_birth, :string
  	add_column :users, :blood_group, :string
  	add_column :users, :emp_personal_mobile_no, :string
  	add_column :users, :emp_personal_email, :string
  	add_column :users, :emp_personal_address, :text
  	add_column :users, :emergency_cotact_no, :string
  end
end
