class CreateComments < ActiveRecord::Migration[6.0]
  def change
    create_table :comments do |t|
      t.integer :user_id
      t.integer :article_id
      t.text :content
      t.timestamps
    end
    add_index :comments, :article_id
    add_index :comments, :user_id
  end
end
