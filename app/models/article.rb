  class Article < ApplicationRecord
  validates :title, presence: true, uniqueness: true, length: { minimum: 5 }
  validates :description, presence: true, length: { maximum: 10000,
    too_long: '1000 characters in post is the maximum allowed.' }

    belongs_to :author, class_name: 'User', foreign_key: :author_id
    has_many :votes, dependent: :destroy
    has_many :art_cats, dependent: :destroy
    has_many :categories, through: :art_cats, dependent: :destroy
    has_many :comments, dependent: :destroy
    has_one_attached :image, dependent: :destroy
    validates :image, presence: true, file_size: { less_than_or_equal_to: 2.megabytes },
    file_content_type: { allow: ['image/jpeg', 'image/png'] }

    def category_list
      self.categories.collect do |category|
        category.name
      end.join(", ")
    end

    def category_list=(categories_string)
      category_names = categories_string.split(/\s\,|\,\s|\s|\,/).collect{|s| s.strip.downcase.capitalize}.uniq.compact
      new_or_found_categories = category_names.collect { |name| Category.find_or_create_by(name: name) }
      self.categories = new_or_found_categories
    end

  
end
