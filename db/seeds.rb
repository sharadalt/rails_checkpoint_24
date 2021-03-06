# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
include RandomData

# Create Topics
 15.times do
  Topic.create!(
   name: RandomData.random_sentence, 
   description: RandomData.random_paragraph
   )
  end
  
topics = Topic.all

# Create SponsoredPosts
 50.times do
   SponsoredPost.create!(
     topic: topics.sample,
     title:  RandomData.random_sentence,
     body:   RandomData.random_paragraph
   )
 end
 posts = SponsoredPost.all
 
 # Create Posts
 50.times do
   Post.create!(
     topic: topics.sample,
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
 

 # Create Questions
 50.times do
 # #1
   Question.create!(
 # #2
     title:  RandomData.random_sentence,
     body:   RandomData.random_paragraph
   )
 end
 questions = Question.all
 
 
 
  
 puts "Seed finished"
 puts "#{Post.count} posts created"
 puts "#{SponsoredPost.count} sponsored_posts created"
 puts "#{Comment.count} comments created"
 puts "#{Advertisement.count} advertisements created"
 puts "#{Question.count} questions created"
 puts "#{Topic.count} topics created"
 
 
 
