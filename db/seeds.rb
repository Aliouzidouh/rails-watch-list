require 'json'
require 'open-uri'
require_relative '../app/models/movie'

url = "https://tmdb.lewagon.com/movie/top_rated"
film_serialized = URI.open(url).read
films = JSON.parse(film_serialized)
film = films['results']

Movie.destroy_all

puts 'Creating films From LE WAGON API...'
film.each do |f|
  movie = Movie.new(title: f['original_title'], overview: f['overview'], rating: f['vote_average'], poster_url: "https://image.tmdb.org/t/p/w500#{f['poster_path']}")
  movie.save!
end
puts 'Finished!'
