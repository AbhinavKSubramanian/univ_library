class Book < ApplicationRecord
  belongs_to :student, optional: true
  
  validates :title, presence: true, length: { minimum: 4 }
  
  validates_uniqueness_of :student_id, allow_nil: true
  
  def self.show_full_list
    Student.all.collect{|f| [f.name, f.id]}
  end
  
  def days_borrowed
    if !borrowed_on.nil?
      days_held=Date.today-borrowed_on
      days_held.to_i
    end
  end
  
  def days_remaining
    if !return_on.nil?
      days_left=return_on-Date.today
      days_left.to_i
    end
   end
end