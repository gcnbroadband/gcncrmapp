class AddClosedDateToComplaints < ActiveRecord::Migration
  def change
  	add_column :complaints, :closed_date, :string
  end
end
