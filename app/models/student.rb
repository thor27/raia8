class Student < ActiveRecord::Base
  attr_accessible :address, :date_of_birth, :email, :name, :phone
  validates_presence_of :name
  validates_format_of :email, with: /.*@.*/
  validates_inclusion_of :state, in: ['active','blocked']
end
