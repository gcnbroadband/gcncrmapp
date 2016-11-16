class BillBook < ActiveRecord::Base
  belongs_to :customer
  belongs_to :user




  def self.to_csv(options = {})
    CSV.generate(options) do |csv|
      csv << column_names
      all.each do |bill|
        csv << bill.attributes.values_at(*column_names)
      end
    end
  end

  def self.import(file)
    CSV.foreach(file.path, headers: true) do |row|
      bill = find_by_id(row["id"]) || new
      bill.attributes = row.to_hash.slice(*column_names)
      bill.save!
    end
  end


end
