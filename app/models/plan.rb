class Plan < ActiveRecord::Base
  belongs_to :customer

  def self.find_by_rate(rate)
    where(plan_value: rate).first
  end
end
