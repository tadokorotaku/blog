class CreateArticles < ActiveRecord::Migration
  def change
    create_table :articles do |t|
      t.references :user, index: true, foreign_key: true
      t.references :category, index: true, foreign_key: true
      t.string :title
      t.text :content
      t.string :slug
      t.boolean :published
      t.datetime :published_at

      t.timestamps null: false
    end
  end
end
