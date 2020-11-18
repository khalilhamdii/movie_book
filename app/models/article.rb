  class Article < ApplicationRecord
  validates :title, presence: true, uniqueness: true, length: { minimum: 5 }
  validates :description, presence: true, length: { maximum: 1000,
    too_long: '1000 characters in post is the maximum allowed.' }

    belongs_to :author, class_name: 'User', foreign_key: :author_id
    has_many :votes, dependent: :destroy
    has_many :art_cats, dependent: :destroy
    has_many :categories, through: :art_cats, dependent: :destroy
    has_one_attached :image, dependent: :destroy
    validate :image_format

    def category_list
      self.categories.collect do |category|
        category.name
      end.join(", ")
    end

    def category_list=(categories_string)
      category_names = categories_string.split(/[\s,\,]/).collect{|s| s.strip.downcase.capitalize}.uniq
      new_or_found_categories = category_names.collect { |name| Category.find_or_create_by(name: name) }
      self.categories = new_or_found_categories
    end

    
  
def resize_image
    resized_image = MiniMagick::Image.read(image.download)
    resized_image = resized_image.resize "400x400"
    v_filename = image.filename
    v_content_type = image.content_type
    image.purge
    image.attach(io: File.open(resized_image.path), filename:  v_filename, content_type: v_content_type)
end
private
def image_format
 return unless image.attached?
 if image.blob.content_type.start_with? 'image/'
   if image.blob.byte_size > 10.megabytes
     errors.add(:image, 'size needs to be less than 10MB')
     image.purge
   else
     resize_image
   end
  else
    image.purge
    errors.add(:image, 'needs to be an image')
  end
end
end
