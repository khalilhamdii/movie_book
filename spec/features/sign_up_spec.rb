require 'rails_helper'
require 'mini_magick'

RSpec.feature 'SignUps', type: :feature do
  scenario 'A user can sign up' do
    visit '/signup'
    fill_in :user_name, with: 'Khalil hamdi'
    fill_in :user_email, with: 'khaalil.hamdi@gmail.com'
    attach_file(:user_avatar, File.absolute_path('./spec/images/avatar.jpeg'))
    click_on 'Submit'
    expect(page).to have_content 'User was successfully created.'
  end

  scenario 'A user can not sign up with a name length less than 3 ' do
    visit '/signup'
    fill_in :user_name, with: 'Kh'
    fill_in :user_email, with: 'khaalil.hamdi@gmail.com'
    attach_file(:user_avatar, File.absolute_path('./spec/images/avatar.jpeg'))
    click_on 'Submit'
    expect(page).to have_content 'Name is too short (minimum is 3 characters)'
  end

  scenario 'A user can not sign up with an empty email' do
    visit '/signup'
    fill_in :user_name, with: 'Khalil Hamdi'
    fill_in :user_email, with: ''
    attach_file(:user_avatar, File.absolute_path('./spec/images/avatar.jpeg'))
    click_on 'Submit'
    expect(page).to have_content "Email can't be blank"
  end
end
