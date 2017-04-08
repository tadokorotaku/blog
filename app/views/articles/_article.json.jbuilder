json.extract! article, :id, :user_id, :category_id, :title, :content, :slug, :published, :published_at, :created_at, :updated_at
json.url article_url(article, format: :json)
