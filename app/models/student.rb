class Student < ActiveRecord::Base
  has_many :participations, dependent: :destroy
  has_many :subject_item_notes, dependent: :destroy
  has_many :subject_items, through: :participations
  has_many :payments, through: :incomes
  has_many :incomes, dependent: :destroy

  validates :first_name, :last_name, presence: true
  accepts_nested_attributes_for :subject_items, :payments
end
