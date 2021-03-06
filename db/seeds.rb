puts "Seeds: start"
TEACHER_TITLES = %w(Dr. Prof. TA)
User.create!(email: 'admin@admin.com',password: 'adminadmin')

3.times do
  Teacher.create!(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    academic_title: TEACHER_TITLES.sample
  )
end

teachers = Teacher.all
5.times do
  SubjectItem.create!(
    title: Faker::Lorem.sentence,
    teacher: teachers.sample
  )
end

25.times do
  Student.create!(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    birthdate: [rand(20.years).seconds.ago-5.years, ""].sample
  )
end

students = Student.all
SubjectItem.all.each do |subject_item|
  subject_item.students << students.sample(rand(1..4))
end

SubjectItem.all.each do |subject_item|
  subject_item.students.each do |student|
    rand(1..5).times do
      subject_item.subject_item_notes << SubjectItemNote.create(student: student,
                                                                subject_item: subject_item,
                                                                value: rand(1..6))
    end
  end
end
i=2
48.times do
  Payment.create!(
    month: DateTime.new(2011,7) + i.months
    )
  i+=1
end
payments = Payment.all
students.each do |student|
  for i in payments do
    Income.create!(
      payment_id: i.id,
      student_id: student.id,
      received: true,
      income_date: i.month + 28.days
      )
  end
end

puts "Seeds: done"
