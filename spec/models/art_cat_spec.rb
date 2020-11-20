# rubocop:disable Layout/EndOfLine, Lint/RedundantCopDisableDirective
require 'rails_helper'

RSpec.describe ArtCat, type: :model do
  it 'checks if belongs to Category' do
    should belong_to(:category)
  end

  it 'checks if belongs to Article' do
    should belong_to(:article)
  end
end

# rubocop:enable Layout/EndOfLine, Lint/RedundantCopDisableDirective
