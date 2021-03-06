class Article < ApplicationRecord
  validates :title, presence: true, uniqueness: true, length: { minimum: 5 }
  validates :description, presence: true, length: { maximum: 10_000,
                                                    too_long: '1000 characters in post is the maximum allowed.' }
  validates :category_list, presence: true

  belongs_to :author, class_name: 'User', foreign_key: :author_id
  has_many :votes, dependent: :destroy
  has_many :art_cats, dependent: :destroy
  has_many :categories, through: :art_cats, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_one_attached :image, dependent: :destroy
  validates :image, attached: true, file_size: { less_than_or_equal_to: 2.megabytes },
                    file_content_type: { allow: ['image/jpeg', 'image/png'] }

  def category_list
    categories.collect(&:name).join(', ')
  end

  def category_list=(category_names)
    new_or_found_categories = category_names.compact.collect { |name| Category.find_or_create_by(name: name) }
    self.categories = new_or_found_categories
  end
end
