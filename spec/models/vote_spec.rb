require 'rails_helper'

RSpec.describe Vote, type: :model do
  it 'checks if belongs to User' do
    should belong_to(:user)
  end

  it 'checks if belongs to Article' do
    should belong_to(:article)
  end
end
