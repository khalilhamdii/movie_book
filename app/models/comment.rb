class Comment < ApplicationRecord
  validates :content, presence: true, length: { minimum: 3, maximum: 100,
                                                too_long: '100 characters in comment is the maximum allowed.' }

  belongs_to :user
  belongs_to :article
end
