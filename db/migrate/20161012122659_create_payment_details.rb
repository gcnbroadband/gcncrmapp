class CreatePaymentDetails < ActiveRecord::Migration
  def change
    create_table :payment_details do |t|
      t.references :customer, index: true
      t.string :plan_cost
      t.string :plan_tax
      t.string :monthly_payment_cost
      t.string :no_of_months_paid
      t.string :installation_charge
      t.string :company_material_use
      t.string :company_material_cost
      t.string :total_amount
      t.string :pending_amount
      t.timestamps
    end
  end
end
