# rubocop:disable Metrics/BlockLength
require 'rails_helper'

RSpec.feature 'CommentAnArticles', type: :feature do
  scenario 'A logged in usr can add a comment to an article' do
    visit '/signup'
    fill_in :user_name, with: 'Khalil hamdi'
    fill_in :user_email, with: 'khaalil.hamdi@gmail.com'
    attach_file(:user_avatar, File.absolute_path('./spec/images/avatar.jpeg'))
    click_on 'Submit'
    visit '/articles/new'
    fill_in :article_title, with: 'Batman'
    fill_in :article_category_list, with: 'Action, Drama'
    fill_in :article_description, with: 'Some summary for batman movie'
    attach_file(:article_image, File.absolute_path('./spec/images/batman.jpeg'))
    click_on 'Create Article'
    visit '/articles'
    click_on 'Batman'
    fill_in :comment_content, with: 'Test comment'
    click_on 'Comment'
    expect(page).to have_content 'Comment was successfully created.'
  end

  scenario "A non logged in usr can't add a comment to an article" do
    visit '/signup'
    fill_in :user_name, with: 'Khalil hamdi'
    fill_in :user_email, with: 'khaalil.hamdi@gmail.com'
    attach_file(:user_avatar, File.absolute_path('./spec/images/avatar.jpeg'))
    click_on 'Submit'
    visit '/articles/new'
    fill_in :article_title, with: 'Batman'
    fill_in :article_category_list, with: 'Action, Drama'
    fill_in :article_description, with: 'Some summary for batman movie'
    attach_file(:article_image, File.absolute_path('./spec/images/batman.jpeg'))
    click_on 'Create Article'
    click_on 'LOGOUT'
    visit '/articles'
    click_on 'Batman'
    expect(page).not_to have_button 'Comment'
  end
end

# rubocop:enable Metrics/BlockLength
