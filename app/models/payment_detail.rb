class PaymentDetail < ActiveRecord::Base
  belongs_to :customer

  def self.to_csv(options = {})
    CSV.generate(options) do |csv|
      csv << column_names
      all.each do |payment|
        csv << payment.attributes.values_at(*column_names)
      end
    end
  end

  def self.import(file)
    CSV.foreach(file.path, headers: true) do |row|
      payment = find_by_id(row["id"]) || new
      payment.attributes = row.to_hash.slice(*column_names)
      payment.save!
    end
  end


end
