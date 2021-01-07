json.array! @blogs, partial: "blogs/blog", as: :blog
json.array! @featured_blogs, partial: "blogs/featured_blog", as: :featured_blog