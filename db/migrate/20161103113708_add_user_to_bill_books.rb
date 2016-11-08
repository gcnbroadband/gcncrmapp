class AddUserToBillBooks < ActiveRecord::Migration
  def change
    add_reference :bill_books, :user, index: true
  end
end
