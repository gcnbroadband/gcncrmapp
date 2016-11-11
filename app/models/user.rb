class User < ActiveRecord::Base
    # Include default devise modules. Others available are:
    # :confirmable, :lockable, :timeoutable and :omniauthable
    belongs_to :zone
    belongs_to :designation
    has_many :customers
    has_many :complaints
    has_many :bill_books
    devise :database_authenticatable, :registerable,
    :recoverable, :rememberable, :trackable, :validatable


    def self.find_all_technician()
        where(designation_id: 7).all 
    end
end
