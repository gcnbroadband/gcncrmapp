class CreateCustomers < ActiveRecord::Migration
  def change
    create_table :customers do |t|
      t.references :zone, index: true
      t.date     "date"
      t.string   "name"
      t.date     "date_of_birth"
      t.text     "billing_address"
      t.string   "pin_no"
      t.string   "billing_mobile_no"
      t.string   "billing_email"
      t.string   "billing_telephone_no"
      t.string   "nationality"
      t.text     "installation_address"
      t.string   "installation_pin_no"
      t.string   "installation_telephone_no"
      t.string   "installation_mobile_no"
      t.string   "installation_email"
      t.string   "net_plan"
      t.string   "address_proof"
      t.string   "address_proof_type"
      t.string   "address_proof_no"
      t.string   "identity_proof"
      t.string   "identity_proof_type"
      t.string   "identity_proof_no"
      t.timestamps
    end
  end
end
