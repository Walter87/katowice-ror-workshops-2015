class ReportsController < ApplicationController
  expose(:subject_items) { SubjectItem.includes(:teacher, :students) }
  expose(:subject_item)

  def subjects
  	
  end
end
