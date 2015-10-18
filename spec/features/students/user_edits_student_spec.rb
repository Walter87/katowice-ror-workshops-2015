require 'spec_helper'

feature 'User edits student' do
  let!(:student) { create :student, first_name: 'Jan', last_name: 'Abacki' }
  let!(:subject_item) { create :subject_item, title: 'Math' }

  background do
    sign_in
    expect(page).to have_content 'Logout'
    visit students_path
    find(:xpath, "//a[@title='edit']").click
  end

  scenario 'and checks breadcrumbs presence' do
    within('.breadcrumbs') do
      expect(page).to have_content 'RoR Workhops » Students  » Jan Abacki'
    end
  end

  scenario 'with valid input' do
    fill_in 'First name', with: 'Marcin'
    click_button 'Update Student'
    expect(page).to have_content 'Student has been updated!'
    expect(page).to have_content 'Marcin'
  end

  scenario 'with invalid input' do
    fill_in 'First name', with: ''
    click_button 'Update Student'
    expect(page).to have_content "can't be blank"
  end

  scenario 'by assigning subject item' do
    visit report_subjects_path
    expect(page).to have_no_content 'Jan Abacki'

    visit students_path
    find(:xpath, "//a[@title='edit']").click
    find("input[type='checkbox']").set(true)
    click_button 'Update Student'

    visit report_subjects_path
    expect(page).to have_content 'Jan Abacki'
  end

  scenario 'by assigning subject item and birthdate' do
    visit report_subjects_path
    expect(page).to have_no_content 'Jan Abacki'

    visit students_path
    find(:xpath, "//a[@title='edit']").click
    find("input[type='checkbox']").set(true)
    select "1987", from: "student[birthdate(1i)]"
    select "August", from: "student[birthdate(2i)]"
    select "27", from: "student[birthdate(3i)]"
    click_button 'Update Student'

    visit report_subjects_path
    expect(page).to have_content 'Jan Abacki'
    expect(page).to have_content '1987-08-27'
  end

  scenario 'by assigning subject item and birthdate and deleting birthdate after' do
    visit students_path
    find(:xpath, "//a[@title='edit']").click
    find("input[type='checkbox']").set(true)
    select "1987", from: "student[birthdate(1i)]"
    select "August", from: "student[birthdate(2i)]"
    select "27", from: "student[birthdate(3i)]"
    click_button 'Update Student'

    visit report_subjects_path
    expect(page).to have_content 'Jan Abacki'
    expect(page).to have_content '1987-08-27'

    visit students_path
    find(:xpath, "//a[@title='edit']").click
    select "", from: "student[birthdate(1i)]"
    select "", from: "student[birthdate(2i)]"
    select "", from: "student[birthdate(3i)]"
    click_button 'Update Student'

    visit report_subjects_path
    expect(page).to have_content 'Jan Abacki'
    expect(page).to have_no_content '1987-08-27'
  end

end
