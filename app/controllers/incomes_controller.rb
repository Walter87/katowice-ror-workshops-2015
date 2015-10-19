class IncomesController < ApplicationController
	expose(:incomes) {Income.includes(:students, :payments)}
	expose(:income)
	expose(:student)
  def edit

  end
  def index
  	
  end
end
