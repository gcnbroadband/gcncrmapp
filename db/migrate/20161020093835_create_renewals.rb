class CreateRenewals < ActiveRecord::Migration
  def change
    create_table :renewals do |t|
      t.references :customer, index: true
      t.string :renew_date
      t.string :renew_plan
      t.string :renew_amount
      t.timestamps
    end
  end
end
