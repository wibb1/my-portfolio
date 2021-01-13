json.extract! blog, :id, :title, :body, :topic_id, :blurb, :created_at, :updated_at
json.url blog_url(blog, format: :json)
