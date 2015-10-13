class StudentDecorator < BaseDecorator
  delegate_all
  #decorates_association :subject_item
  
  def full_name
    "#{first_name} #{last_name}"
  end

  def avg_notes(subject_item)
    notes = self.subject_item_notes.where(subject_item_id: subject_item.id)
    sum = 0.0
  	if notes.any?
      notes.each do |x|
        sum = sum+x.value        
      end
      sum = sum/notes.count
      
  	end
    h.number_with_precision(sum, precision: 2)
  
  end
end
