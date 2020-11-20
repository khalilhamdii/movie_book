class User < ApplicationRecord
  validates :name, presence: true, length: { minimum: 3 }
  validates :email, presence: true, uniqueness: true
  has_many :created_articles, foreign_key: :author_id, class_name: 'Article'
  has_many :comments, dependent: :destroy
  has_many :votes, dependent: :destroy
  has_one_attached :avatar, dependent: :destroy
  validates :avatar, attached: true, file_size: { less_than_or_equal_to: 2.megabytes },
    file_content_type: { allow: ['image/jpeg', 'image/png'] }

end
