class Customer < ActiveRecord::Base

  mount_uploader :address_proof, AddressProofUploader
  mount_uploader :identity_proof, IdentityProofUploader

  belongs_to :zone
  belongs_to :user
  has_one :payment_detail
  has_many :bill_books

  accepts_nested_attributes_for :bill_books
  accepts_nested_attributes_for :payment_detail



  def self.search(param)
    return Customer.none if param.blank?

    param.strip!
    param.downcase!

    (name_matches(param) + email_matches(param) + mobile_no_matches(param) +telephone_no_matches(param)).uniq
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
