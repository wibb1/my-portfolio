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
    body: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
    topic_id: Topic.last.id
  )
end

puts "10 blog posts created"

5.times do |skill|
  Skill.create!(
  title: "Rails #{skill}",
  percent_utilized: 15)
end

8.times do |item|
  Portfolio.create!(
  title: "Portfolio Title #{item}",
  subtitle: "Ruby on Rails",
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

User.create!(
  email: "user@aol.com",
  password: "123456",
  name: "Site User",
  roles: "user"
)

puts "default admin and default user created"
