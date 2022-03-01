require 'rails_helper'

RSpec.describe Api::V1::MoviesController, type: :controller do
  let!(:genre) { create(:genre) }
  let!(:movie) { create(:movie, genre: genre) }

  describe 'GET movies' do
    it 'has a 200 status code' do
      get :index
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET movies/:id' do
    it 'has a 200 status code' do
      get :show, params: { id: movie.id }
      expect(response).to have_http_status(:success)
    end
  end

  # describe 'POST create' do
  #   it 'creates new movie' do
  #     expect do
  #       post :create, params: { genre_id: genre.id, movie: { title: 'New Movie', year: '2022', rating: 1.5, expert_rating: 3.5, watched: true }.to_json }
  #     end.to change(Movie, :count).by(1)
  #   end
  # end

  describe 'POST create' do
    it 'creates new movie' do
        post :create, params: { genre_id: genre.id, movie: { title: 'New Movie', year: '2022', rating: 1.5, expert_rating: 3.5, watched: true }.to_json }
        expect(response).to have_http_status(:created)
        expect(JSON.parse(response.body).size).to eq(2)
    end
  end
  

  describe 'PATCH update' do
    it 'updates the movie' do
      patch :update, params: { genre_id: genre.id, id: movie.id, movie: { title: movie.title } }
      expect(response).to have_http_status(:success)
    end
  end

  describe 'DELETE destroy' do
    it 'deletes the comment' do
      expect do
        delete :destroy, params: { genre_id: genre.id, id: movie.id }
      end.to change(Movie, :count).by(-1)
    end
  end
end