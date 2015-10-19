class Income < ActiveRecord::Base
  belongs_to :payment
  belongs_to :student

  validates :student, :payment, presence: true
  validates :student, uniqueness: { scope: :payment }
end
