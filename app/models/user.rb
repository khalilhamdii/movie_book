class User < ApplicationRecord
  validates :name, presence: true, length: { minimum: 3 }
  validates :email, presence: true, uniqueness: true
  has_many :created_articles, foreign_key: :author_id, class_name: 'Article'
  has_many :votes, dependent: :destroy
end
