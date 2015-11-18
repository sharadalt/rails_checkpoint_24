# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
include RandomData
 
 # Create Posts
 50.times do
 # #1
   Post.create!(
 # #2
     title:  RandomData.random_sentence,
     body:   RandomData.random_paragraph
   )
 end
 posts = Post.all
 
 # Create Comments
 # #3
 100.times do
   Comment.create!(
 # #4
     post: posts.sample,
     body: RandomData.random_paragraph
   )
 end
 
 puts "Seed finished"
 puts "#{Post.count} posts created"
 puts "#{Comment.count} comments created"
 Post.find_or_create_by(title: "Unique title", body:"Unique body")
 Post.find_or_create_by(title: "Unique Title2", body: "Unique body2")

# Create Advertisements
 50.times do
 # #1
   Advertisement.create!(
 # #2
     title:  RandomData.random_sentence,
     copy:   RandomData.random_paragraph
   )
 end
 advertisements = Advertisement.all
 
 puts "Seed finished"
 puts "#{Advertisement.count} advertisements created"
 
 # Create Questions
 50.times do
 # #1
   Question.create!(
 # #2
     title:  RandomData.random_sentence,
     body:   RandomData.random_paragraph
   )
 end
 questions = Advertisement.all
 
 puts "Seed finished"
 puts "#{Question.count} questions created"
 

 
