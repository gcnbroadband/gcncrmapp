class CreateZones < ActiveRecord::Migration
  def change
    create_table :zones do |t|
      t.string   "zone_code"
      t.string   "zone_name"
      t.string   "district"
      t.string   "state"
      t.timestamps
    end
  end
end
