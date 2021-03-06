require 'rails_helper'

RSpec.describe User, type: :model do
  let(:invalid_user) { User.new(name: 'kh', email: 'kh@mail.com') }

  it 'checks if user name with 2 letters is not valid' do
    expect(invalid_user).not_to be_valid
  end

  it 'checks if name is present' do
    should validate_presence_of(:name)
  end

  it 'checks if email is present' do
    should validate_presence_of(:email)
  end

  it 'checks if has many created articles' do
    should have_many(:created_articles)
  end

  it 'checks if has many comments' do
    should have_many(:comments)
  end

  it 'checks if has many votes' do
    should have_many(:votes)
  end

  it 'checks if avatar is attached' do
    is_expected.to validate_attached_of(:avatar)
  end
end
