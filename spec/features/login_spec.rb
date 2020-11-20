require 'rails_helper'

RSpec.feature "Logins", type: :feature do
  scenario 'A user can login' do
    visit '/signup'
    fill_in :user_name, with: 'Khalil hamdi'
    fill_in :user_email, with: 'khaalil.hamdi@gmail.com'
    attach_file(:user_avatar, File.absolute_path('./spec/images/avatar.jpeg'))
    click_on 'Submit'
    visit '/categories'
    click_on 'LOGOUT'
    visit '/login'
    fill_in :email, with: 'khaalil.hamdi@gmail.com'
    click_on 'Submit'
    expect(page).to have_content 'Logged in!'
  end
end
