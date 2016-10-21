class CreatePlans < ActiveRecord::Migration
  def change
    create_table :plans do |t|
      t.references :customer, index: true
      t.string :plan_value
      t.string :plan_pattern
      t.timestamps
    end
  end
end
