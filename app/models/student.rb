class Student < ActiveRecord::Base
  has_many :payments, dependent: :destroy
  attr_accessible :address, :date_of_birth, :email, :name, :phone
  validates_presence_of :name
  validates_format_of :email, with: /.*@.*/, allow_blank: true
  validates_inclusion_of :state, in: ['active','blocked']
  
  def active?
    self[:state] == 'active'
  end
end
