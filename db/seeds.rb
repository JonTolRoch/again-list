# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
require "open-uri"
require "json"

puts "Cleaning up database..."
Movie.destroy_all
puts "Database cleaned"

def generate_movies(count)
  base_url = "https://image.tmdb.org/t/p/"
  poster_size = "w185"

  url = "http://tmdb.lewagon.com/movie/popular"
  count.times do |i|
    puts "Importing Movies from page #{i + 1}"
    movies = JSON.parse(URI.open("#{url}?page=#{i + 1}").read)['results']
    movies.each do |movie|
      puts "Creating #{movie['title']}"
      poster_path = movie['poster_path']
      poster_url = "#{base_url}#{poster_size}/#{poster_path}"
      Movie.create(
        title: movie['title'],
        overview: movie['overview'],
        poster_url: poster_url,
        rating: movie['vote_average']
      )
    end
  end
  puts "Movies Created"
end

generate_movies(10)
