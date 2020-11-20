require 'rails_helper'
require "mini_magick"

RSpec.feature "SignUps", type: :feature do
  scenario 'A user can sign up' do
    visit '/signup'
    fill_in :user_name, with: 'Khalil hamdi'
    fill_in :user_email, with: 'khaalil.hamdi@gmail.com'
    attach_file(:user_avatar, File.absolute_path('./spec/images/avatar.jpeg'))
    click_on 'Submit'
    expect(page).to have_content 'User was successfully created.'
  end
end
