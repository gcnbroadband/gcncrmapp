class AddComplaintClosedByToComplaints < ActiveRecord::Migration
  def change
  	add_column :complaints, :complaint_closed_by, :string
  end
end
