# rubocop:disable Layout/EndOfLine, Lint/RedundantCopDisableDirective
require 'rails_helper'

RSpec.describe Category, type: :model do
  it 'checks if has many articles' do
    should have_many(:articles)
  end

  it 'checks if has many art_cats' do
    should have_many(:art_cats)
  end
end

# rubocop:enable Layout/EndOfLine, Lint/RedundantCopDisableDirective
