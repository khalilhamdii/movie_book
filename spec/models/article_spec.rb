require 'rails_helper'

RSpec.describe Article, type: :model do
  let(:invalid_article) { Article.new(title: 'ti', description: 'some article content') }

  it 'checks if article title with 2 letters is not valid' do
    expect(invalid_article).not_to be_valid
  end

  it 'checks if title is present' do
    should validate_presence_of(:title)
  end

  it 'checks if description is present' do
    should validate_presence_of(:description)
  end

  it 'checks if article image is attached' do
    is_expected.to validate_attached_of(:image)
  end

  it 'checks if has many votes' do
    should have_many(:votes)
  end

  it 'checks if has many comments' do
    should have_many(:comments)
  end

  it 'checks if has many categories' do
    should have_many(:categories)
  end
end
