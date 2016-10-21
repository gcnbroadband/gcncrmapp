class AddUserToComplaints < ActiveRecord::Migration
  def change
    add_reference :complaints, :user, index: true
  end
end
