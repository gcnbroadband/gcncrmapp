class AddComplaintFixedByToComplaints < ActiveRecord::Migration
  def change
  	add_column :complaints, :complaint_fixed_by, :string
  end
end
