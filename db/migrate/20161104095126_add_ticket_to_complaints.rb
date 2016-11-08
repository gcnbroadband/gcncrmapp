class AddTicketToComplaints < ActiveRecord::Migration
  def change
  	add_column :complaints, :ticket, :string
  end
end
