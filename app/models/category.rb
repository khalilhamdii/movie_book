class Category < ApplicationRecord
  has_many :art_cats, dependent: :destroy
  has_many :articles, through: :art_cats, dependent: :destroy

  def to_s
    name
  end
end
