module Api
  module V1
    class MoviesController < ApplicationController
      before_action :find_movie, only: [:show, :update, :destroy]

      # GET /movies
      def index
        @movies = Movie.all

        render json: @movies
      end

      def genres
        @genres = Genre.all

        render json: @genres
      end

      # GET /movies/1
      def show
        render json: @movie
      end

      # POST /movies
      def create
        @movie = Movie.new(movie_params)

        if @movie.save
          render json: @movie, status: :created, location: @movie
        else
          render json: @movie.errors, status: :unprocessable_entity
        end
      end

      # PATCH/PUT /movies/1
      def update
        if @movie.update(movie_params)
          render json: @movie
        else
          render json: @movie.errors, status: :unprocessable_entity
        end
      end

      # DELETE /movies/1
      def destroy
        @movie.destroy
      end

      private
        # Use callbacks to share common setup or constraints between actions.
        def find_movie
          @movie = Movie.find(params[:id])
        end

        # Only allow a list of trusted parameters through.
        def movie_params
          params.require(:movie).permit(:title, :year, :rating, :expert_rating, :watched)
        end
    end
  end
end
