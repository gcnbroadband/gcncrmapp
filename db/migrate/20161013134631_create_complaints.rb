class CreateComplaints < ActiveRecord::Migration
  def change
    create_table :complaints do |t|
      t.belongs_to :customer, index: true	
      t.string :complaint_sub	
      t.text :complaint_body
      t.timestamps
    end
  end
end
