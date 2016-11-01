class AddComplaintResolveToComplaints < ActiveRecord::Migration
  def change
  	add_column :complaints, :complaint_resolve, :boolean, default: false
  	add_column :complaints, :real_issue, :text
  end
end
