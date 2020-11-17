class Category < ApplicationRecord
  has_many :art_cats
  has_many :articles, through: :art_cats

  def to_s
    name
  end
end
