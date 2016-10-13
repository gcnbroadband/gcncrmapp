class AddDesignationToUsers < ActiveRecord::Migration
  def change
    add_reference :users, :designation, index: true
  end
end
