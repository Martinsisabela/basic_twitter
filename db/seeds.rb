# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end


user = User.find_or_create_by(
    username: "Anna Martins",
    email: "annamartins@gmail.com"
)

tweet = Tweet.find_or_create_by(
    user_id: user.id,
    text: "Hello world! This is my first tweet"
)

comment = Comment.find_or_create_by(
    tweet_id: tweet.id,
    content: "Like"
)

Like.find_or_create_by(
    tweet_id: tweet.id,
    user_id: user.id
)

Repost.find_or_create_by(
    tweet_id: tweet.id,
    user_id: user.id
)