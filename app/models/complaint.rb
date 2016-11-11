class Complaint < ActiveRecord::Base
	belongs_to :customer
	belongs_to :user


	# after_create do |complaint|
	#    complaint.ticket = "gcn#{complaint.customer.zone.zone_name}#{complaint.customer_id}#{complaint.id}".upcase
	#    complaint.save!
	# end

	after_create do |complaint|
	   complaint.ticket = "RET" + complaint.id.to_s.rjust(5, "0")
	   complaint.save!
	end

	# after_create do
	#     self.ticket = "gcn#{self.id}" 
	# end
end
