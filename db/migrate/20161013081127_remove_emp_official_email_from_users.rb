class RemoveEmpOfficialEmailFromUsers < ActiveRecord::Migration
  def change
    remove_column :users, :emp_official_email, :string
  end
end
