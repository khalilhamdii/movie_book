class RemoveForeignKeys < ActiveRecord::Migration[6.0]
  def change
    remove_foreign_key "articles", "users", column: "author_id"
    remove_foreign_key "votes", "articles"
    remove_foreign_key "votes", "users"

    add_index :votes, :article_id
    add_index :votes, :user_id
  end
end
