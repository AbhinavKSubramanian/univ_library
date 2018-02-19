class Student < ApplicationRecord
  has_one :book
  validates :name, presence: true,
		length: { minimum: 4}
end