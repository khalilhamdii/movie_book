require 'rails_helper'

RSpec.describe Comment, type: :model do
  let(:invalid_comment) { Comment.new(user_id: 1, article_id: 1, content: '') }

  it 'checks if comment with empty content is not valid' do
    expect(invalid_comment).not_to be_valid
  end

  it 'checks if comment content is present' do
    should validate_presence_of(:content)
  end

  it 'checks if belongs to User' do
    should belong_to(:user)
  end

  it 'checks if belongs to Article' do
    should belong_to(:article)
  end
end
