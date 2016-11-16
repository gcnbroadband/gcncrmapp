class Plan < ActiveRecord::Base
  belongs_to :customer

  def self.find_by_rate(rate)
    where(plan_value: rate).first
  end

  def self.to_csv(options = {})
  	CSV.generate(options) do |csv|
  		csv << column_names
  		all.each do |plan|
  			csv << plan.attributes.values_at(*column_names)
  		end
  	end
  end

  def self.import(file)
  	CSV.foreach(file.path, headers: true) do |row|
  		plan = find_by_id(row["id"]) || new
  		plan.attributes = row.to_hash.slice(*column_names)
  		plan.save!
  	end
  end
end
