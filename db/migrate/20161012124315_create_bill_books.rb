class CreateBillBooks < ActiveRecord::Migration
  def change
    create_table :bill_books do |t|
      t.references :customer, index: true
      t.string   "bill_book_no"
      t.string   "bill_no"
      t.string   "bill_amount"
      t.integer  "customer_id"
      t.string   "pending_bill"
      t.string   "bill_book_date"
      t.string   "bill_paid_by"
      t.timestamps
    end
  end
end
