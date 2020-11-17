  class Article < ApplicationRecord
  validates :title, presence: true, uniqueness: true, length: { minimum: 5 }
  validates :description, presence: true, length: { minimum: 10 }

    belongs_to :author, class_name: 'User', foreign_key: :author_id
    has_many :votes, dependent: :destroy
    has_many :art_cats
    has_many :categories, through: :art_cats
end
