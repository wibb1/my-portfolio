# My Portfolio

This app was part of a deeper dive into the Ruby on Rails playground.  After Launch Academy I wanted to learn more about how to structure a Ruby on Rails app, so I found an Udemy course that would help me learn more.  The course I found was called "Dissecting Ruby on Rails 5 - Become a Professional Developer" from Jordan Hudgens, CTO at Bottega Code School.  

I really enjoyed the course, the format of the app and the different technologies used really kept me on my toes, and I learned a lot.  The best part was definitely gaining a better understanding of when and how to split up code and where to put the code in the rails framework.  We used concerns, helpers, jobs, channels and moving code to the model to dry up the controller code.

This app is the basis of that course, although I have put several of my own tweeks on it, including:  
* updating the blog layout to the latest bootstrap layout and using the featured blogs partial to deliver that layout.  
* expanding the enum controlling blog status to also flag a blog as featured not just draft and published.  The two featured blogs are included on the blogs page.
* beefing up the news page by adding the API call to newsAPI to get the latest news articles and changing the layout to the blog layout to take advantage of the featured blogs layout format. 
* selecting to not use a model for the news articles and just creating a PORO to handle formatting and feeding data to the front end to limit the storage space required on the back end.
* adding my resume to the about me page and using bootstrap to format it providing a better user experience.
* integrating topic links into the blog page headings using the same process as for other links used in the headers.
* adding my own video loop with pictures that I took on my travels throughout the world.
* adding the hover feature to the home page and the enjoy page call allowing a user to see the photos better.

This app will serve as my portfolio for other projects that I have completed, a space to put some of the gist/instructions that I have put together, and a place to put notes on the things I learn along the way.    

## Deployed
Not currently deployed 

## Author 
Will Campbell

## Built With
Ruby on Rails
JavaScript
PostgreSQL

## Technologies/Gems
Bootstrap
Devise
Petergate
Kaminari
jQuery
Carrierwave
Gritter
Twitter
Redis
Red Carpet
Coderay
Faraday
Action Cable
Friendly_Id
---


### Getting Started

* Ruby 2.6.5
* Rails 5.2.4
* PostgreSQL 12

Repository
```
git clone https://github.com/wibb1/my-portfolio
```

database setup
```
bunlde exec rake db:setup
```

Start the rails server
```
bundle exec rails s
```

access the application at 
http://localhost:3000
