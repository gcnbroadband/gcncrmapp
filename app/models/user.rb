class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  belongs_to :zone
  belongs_to :designation
  has_many :customers
  has_many :complaints
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
