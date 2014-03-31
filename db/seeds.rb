# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Language.create do |l|
  l.name = "Rails"
end

Language.create do |l|
  l.name = "iOS"
end

Language.create do |l|
  l.name = "Backbone"
end

Language.create do |l|
  l.name = "Node.js"
end

Link.create do |l|
  l.title = "How to Create a Simple iPhone App (in 3 parts)"
  l.description = "Ray Wenderlich's tutorials are completely comprehensive and have a ton of screenshots. This one takes you through the steps of making your first iPhone app with table views and an image picker. It introduces iOS patterns and the XCode working environment without overloading you with a lot of theory."
  l.url = "http://www.raywenderlich.com/1797/ios-tutorial-how-to-create-a-simple-iphone-app-part-1"
  l.level = 1
  l.free = true
  l.user_id = 1
end

Tag.create do |t|
  t.link_id = Link.last.id
  t.language_id = 2
end

Link.create do |l|
  l.title = "Build a Twitter Clone"
  l.description = "Michael Hartl's epic tutorial covers everything from installing Rails to using Github, deploying on Heroku and writing tests. It takes awhile to get through but once you've finished you'll be set to start writing your own apps."
  l.url = "http://ruby.railstutorial.org/ruby-on-rails-tutorial-book"
  l.level = 1
  l.free = true

  l.user_id = 1
end

Tag.create do |t|
  t.link_id = Link.last.id
  t.language_id = 1
end

Link.create do |l|
  l.title = "Make a ToDo app"
  l.description = "Great simple example Backbone app. Has a model, view, and collection, and persists data locally using LocalStorage."
  l.url = "http://backbonejs.org/docs/todos.html"
  l.level = 1
  l.free = true

  l.user_id = 1
end

Tag.create do |t|
  t.link_id = Link.last.id
  t.language_id = 3
end

Link.create do |l|
  l.title = "iOS Programming: The Big Nerd Ranch Guide"
  l.description = "Big Nerd Ranch is one of the leading publishers of mobile app dev books. This book is extremely in-depth and teaches you a lot about Objective C and some theory around iOS dev."
  l.url = "http://www.amazon.com/iOS-Programming-Ranch-Edition-Guides/dp/0321942051"
  l.level = 1
  l.free = false

  l.user_id = 1
end

Tag.create do |t|
  t.link_id = Link.last.id
  t.language_id = 2
end

Link.create do |l|
  l.title = "The Node Beginner Book"
  l.description = "A very comprehensive introduction to Node and Javascript."
  l.url = "http://www.nodebeginner.org/"
  l.level = 1
  l.free = true

  l.user_id = 1
end

Tag.create do |t|
  t.link_id = Link.last.id
  t.language_id = 4
end

Link.create do |l|
  l.title = "Getting Started with Rails: Make a Blog"
  l.description = "This is official guide by the Rails core team. It's pretty good at explaining what you're doing along the way. Because it's so connected to Rails, it is always kept up-to-date."
  l.url = "http://guides.rubyonrails.org/getting_started.html"
  l.level = 1
  l.free = true

  l.user_id = 1
end

Tag.create do |t|
  t.link_id = Link.last.id
  t.language_id = 1
end

Link.create do |l|
  l.title = "Hello Backbone.js"
  l.description = "This tutorial breaks down a Backbone app into 5 parts, and presents them in increasing complexity. It explains briefly what every function does without going into excessive detail."
  l.url = "http://arturadib.com/hello-backbonejs/"
  l.level = 1
  l.free = true

  l.user_id = 1
end

Tag.create do |t|
  t.link_id = Link.last.id
  t.language_id = 3
end

Link.create do |l|
  l.title = "One Month Rails"
  l.description = "One Month Rails is a series of video lessons and exercises that show anyone (even a total beginner) how to build their first web application (a simple photo-sharing app)."
  l.url = "https://onemonthrails.com/"
  l.level = 1
  l.free = false

  l.user_id = 1
end

Tag.create do |t|
  t.link_id = Link.last.id
  t.language_id = 1
end

Link.create do |l|
  l.title = "Beginner’s Guide To iOS Development"
  l.description = "This is a very basic guide to iOS development aimed at designers. It gives a nice tour of the environment and even a nice gallery of example interfaces."
  l.url = "http://www.hongkiat.com/blog/ios-development-guide-part1/"
  l.level = 1
  l.free = true

  l.user_id = 1
end

Tag.create do |t|
  t.link_id = Link.last.id
  t.language_id = 2
end
