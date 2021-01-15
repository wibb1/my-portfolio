3.times do |topic|
  Topic.create!(
    title: "Topic #{topic}"
  )  
end

puts "3 topics created"

10.times do |blog|
  Blog.create!(
    title: "My Blog Post #{blog}",
    blurb: "Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
    body: '<h3>Lorem Ut Duis</h3><p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.<p>

    ```ruby 
    class BlogsChannel < ApplicationCable::Channel
      def subscribed
        stream_from "blogs_#{params["blog_id"]}_channel"
      end
      
      def unsubscribed
      end
      
      def send_comment(data)
      current_user.comments.create!(
        content: data["comment"], blog_id: data["blog_id"]
        )
      end
    end
    ```
      
    <h6>Nunc Vestibulum</h6><p>Proin sodales feugiat massa, eget faucibus magna tempus ut. Aliquam rhoncus sit amet neque eget pharetra. Etiam luctus augue augue, ut sagittis quam elementum a. Vivamus quis ante at odio volutpat semper. Duis a lectus venenatis, porttitor diam at, vestibulum dolor. Interdum et malesuada fames ac ante ipsum primis in faucibus. Donec vitae nisl sed enim vulputate maximus. Vestibulum nec nulla convallis, faucibus orci vel, pharetra urna. Nulla vel lorem sollicitudin augue scelerisque porta. Aliquam erat volutpat.</p>',
    topic_id: Topic.last.id
  )
end

puts "10 blog posts created"

Blog.third.published!
Blog.fourth.published!
Blog.fifth.published!

puts "3 blog posts set to published"

Blog.first.featured!
Blog.second.featured!

puts "2 blog posts set to featured"

5.times do |skill|
  Skill.create!(
  title: "Rails #{skill}",
  percent_utilized: 15)
end

puts '5 skills created'

8.times do |item|
  Portfolio.create!(
  title: "Portfolio Title #{item}",
  subtitle: "Ruby on Rails",
  blurb: "Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
  body: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
  #main_image: Rails.root.join("app/assets/images/default_main_image.png").open,
  #thumb_image: Rails.root.join("app/assets/images/default_thumb_image.png").open
  )
end

puts "8 portfolio items created with Ruby on Rails subtitle"

1.times do |item|
  Portfolio.create!(
  title: "Portfolio Title #{item}",
  subtitle: "Angular",
  blurb: "Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
  body: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
  #main_image: Rails.root.join("app/assets/images/default_main_image.png").open,
  #thumb_image: Rails.root.join("app/assets/images/default_thumb_image.png").open
  )
end

puts "1 portfolio item created with Angular subtitle"

3.times do |technology|
  Portfolio.last.technologies.create!(
    name:"Technology #{technology}"
  )
end

puts "3 technologies created"

User.create!(
  email: "admin@aol.com",
  password: "123456",
  name: "Site Admin",
  roles: "site_admin"
)

puts "1 default admin user created"

User.create!(
  email: "user@aol.com",
  password: "123456",
  name: "Site User",
  roles: "user"
)

puts "1 default user created"
