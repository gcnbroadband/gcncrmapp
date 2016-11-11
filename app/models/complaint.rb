class Complaint < ActiveRecord::Base
	belongs_to :customer
	belongs_to :user


	# after_create do |complaint|
	#    complaint.ticket = "gcn#{complaint.customer.zone.zone_name}#{complaint.customer_id}#{complaint.id}".upcase
	#    complaint.save!
	# end

	after_create do |complaint|
	   current = Time.now
	   currentYear = current.year.to_s
	   yearEnd = currentYear[2..3]
	   complaint.ticket = "R#{yearEnd}#{current.month.to_s}" + complaint.id.to_s.rjust(7, "0")
	   complaint.save!
	end

	# after_create do
	#     self.ticket = "gcn#{self.id}" 
	# end
end
