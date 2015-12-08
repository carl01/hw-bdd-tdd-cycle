require 'rails_helper'

describe MoviesController do
  before(:each) do
    load "#{Rails.root}/spec/fixtures/seeds_spec.rb" 
  end
  describe 'when the movie has a director' do
    it 'should call the model method that performs TMDB search' do
      expect(Movie).to receive(:find_movies_with_same_director).with('Lucas')
      # Movie.should_receive(:find_movies_with_same_director).with('Lucas') # old syntax
      params = {
      id: 1}
      get :find_with_same_director, params
    end
  end
  describe 'when the movie has not a director' do
    it 'should go to the home page' do
      #expect(response).to render_template('index')
      response.should render_template('index')
      get :root
    end
  end
end