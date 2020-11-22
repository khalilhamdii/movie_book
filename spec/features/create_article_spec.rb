# rubocop:disable Metrics/BlockLength
require 'rails_helper'

RSpec.feature 'CreateArticles', type: :feature do
  scenario 'can create an article' do
    visit '/signup'
    fill_in :user_name, with: 'Khalil hamdi'
    fill_in :user_email, with: 'khaalil.hamdi@gmail.com'
    attach_file(:user_avatar, File.absolute_path('./spec/images/avatar.jpeg'))
    click_on 'Submit'
    visit '/articles/new'
    fill_in :article_title, with: 'Batman'
    select 'Action', from: 'article_category_list'
    select 'Action', from: 'article_category_list'
    fill_in :article_description, with: 'Some summary for batman movie'
    attach_file(:article_image, File.absolute_path('./spec/images/batman.jpeg'))
    click_on 'Create Article'
    expect(page).to have_content 'Article was successfully created.'
  end

  scenario "can't create an article without an image" do
    visit '/signup'
    fill_in :user_name, with: 'Khalil hamdi'
    fill_in :user_email, with: 'khaalil.hamdi@gmail.com'
    attach_file(:user_avatar, File.absolute_path('./spec/images/avatar.jpeg'))
    click_on 'Submit'
    visit '/articles/new'
    fill_in :article_title, with: 'Batman'
    select 'Action', from: 'article_category_list'
    select 'Action', from: 'article_category_list'
    fill_in :article_description, with: 'Some summary for batman movie'
    click_on 'Create Article'
    expect(page).to have_content "Image can't be blank"
  end

  scenario "can't create an article without adding categories" do
    visit '/signup'
    fill_in :user_name, with: 'Khalil hamdi'
    fill_in :user_email, with: 'khaalil.hamdi@gmail.com'
    attach_file(:user_avatar, File.absolute_path('./spec/images/avatar.jpeg'))
    click_on 'Submit'
    visit '/articles/new'
    fill_in :article_title, with: 'Batman'
    fill_in :article_description, with: 'Some summary for batman movie'
    attach_file(:article_image, File.absolute_path('./spec/images/batman.jpeg'))
    click_on 'Create Article'
    expect(page).to have_content "Category list can't be blank"
  end
end

# rubocop:enable Metrics/BlockLength
