Given /the following movies exist/ do |movies_table|
  movies_table.hashes.each do |movie|
    # each returned element will be a hash whose key is the table header.
    # you should arrange to add that movie to the database here.
    inserted_movie = Movie.create(movie)
  end
  # fail "Unimplemented"
end

Then /the director of "Alien" should be "Ridley Scott"/ do
  #Movie.update(3, director: "Ridley Scott")
  movie = Movie.find 3
  expect(movie.director).to eq("Ridley Scott")
end