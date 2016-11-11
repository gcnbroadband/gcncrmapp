class Customer < ActiveRecord::Base

  mount_uploader :address_proof, AddressProofUploader
  mount_uploader :identity_proof, IdentityProofUploader

  belongs_to :zone
  belongs_to :user
  has_one :payment_detail
  has_many :bill_books
  has_many :complaints
  has_many :renewals

  accepts_nested_attributes_for :bill_books
  accepts_nested_attributes_for :payment_detail


  # after_create do |complaint|
  #    complaint.ticket = "gcn#{complaint.customer.zone.zone_name}#{complaint.customer_id}#{complaint.id}".upcase
  #    complaint.save!
  # end




  after_create do |customer|
     customer.app_id = "#{customer.zone.zone_code}"+ customer.id.to_s.rjust(7, "0")
     customer.save!
  end

  def self.find_by_userid(userid)
    where(cust_id: userid).first
  end
  def self.find_by_zone_id(zoneid)
    where(zone_id: zoneid).all
  end

  
  
  def self.search(param)
    return Customer.none if param.blank?
    param.strip!
    param.downcase!

    (app_id_matches(param) + cust_id_matches(param) + name_matches(param) + email_matches(param) + mobile_no_matches(param) +telephone_no_matches(param)).uniq
  end

  def self.app_id_matches(param)
    matches('app_id', param)
  end

  def self.cust_id_matches(param)
    matches('cust_id', param)
  end
  
  def self.name_matches(param)
    matches('name', param)
  end

  def self.email_matches(param)
    matches('billing_email', param)
  end
  def self.mobile_no_matches(param)
    matches('billing_mobile_no', param)
  end
  def self.telephone_no_matches(param)
    matches('billing_telephone_no', param)
  end

  def self.matches(field_name, param)
    where("lower(#{field_name}) like?","%#{param}%")
  end 
end
