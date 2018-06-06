# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# Create Users
@users = []
[
  [ 'pm1@promobi.com',  'test12345',  :admin ],
  [ 'dev1@promobi.com', 'test12345',  :developer ]
].each do | email, password, role |
  u  = User.new(email: email, password: password)
  u.add_role role
  u.save
  @users << u
end

# Create Developers
5.times do |i|
  u = User.new(email: Faker::Internet.email, password: Faker::Internet.password(8))
  u.add_role :developer
  u.save
  @users << u
end

# Create Projects
@projects = []
3.times do |i|
  @projects << Project.new(title: Faker::Commerce.product_name)
end

#Create T asks
10.times do |i|
  project = @projects.sample
  user = @users.sample
  task = Task.new(title: Faker::Company.catch_phrase, user: user)
  project.tasks << task
  project.save
end
