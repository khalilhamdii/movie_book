class AddAuthorToArticle < ActiveRecord::Migration[6.0]
  def change
    add_reference :articles, :author, references: :users, index: true
    add_foreign_key :articles, :users, column: :author_id
  end
end
