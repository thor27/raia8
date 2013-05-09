class Payment < ActiveRecord::Base
  belongs_to :student
  attr_accessible :date_of_payment, :reference_month, :reference_year, :value
  validates_presence_of :student_id, :date_of_payment, :reference_month, :reference_year, :value
  validates_uniqueness_of :student_id, scope: [:reference_month, :reference_year]
  validates_numericality_of :reference_month, 
    only_integer: true, 
    greater_than_or_equal_to: 1, 
    less_than_or_equal_to: 12

  validates_numericality_of :reference_year, 
    only_integer: true, 
    greater_than_or_equal_to: 2000, 
    less_than_or_equal_to: 2999
  
  validates_numericality_of :value,
    greater_than: 0
end
