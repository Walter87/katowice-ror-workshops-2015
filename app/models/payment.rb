class Payment < ActiveRecord::Base
	has_many :incomes, dependent: :destroy
	has_many :students, through: :incomes
end
