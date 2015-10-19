class StudentsController < ApplicationController
  before_action :authenticate_user!
  expose(:student, attributes: :student_params)
  expose(:student_subject_items) { student.subject_items }
  expose(:student_payments) { student.payments }
  expose_decorated(:students)

  def create
    if student.save
      redirect_to student_path(student), notice: I18n.t('shared.created', resource: 'Student')
    else
      render :new
    end
  end

  def update
    if student.save
      redirect_to student_path(student), notice: I18n.t('shared.updated', resource: 'Student')
    else
      render :edit
    end
  end

  def destroy
    student.destroy
    redirect_to students_path, notice: I18n.t('shared.deleted', resource: 'Student')
  end
  
  def subjects
  end

  def paid_tuition
     
  end
private

  def student_params
    params.require(:student).permit(:first_name, :last_name, :birthdate, subject_item_ids: [], payments: [])
  end  
end  
