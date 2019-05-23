class MoviesController < ApplicationController
  def index
    #if there is a query
    #return all the movies that match the query
    if params[:query].present?
      #@movies = Movie.where(title: params[:query]) returns full match
      #@movies = Movie.where("title ILIKE ?", "%#{params[:query]}%") return ilike matches for title
      #sql_query = "title ILIKE :query OR syllabus ILIKE :query"
      #@movies = Movie.where(sql_query, query: "%#{params[:query]}%" ) return ilike matches for title and syllabus
      # sql_query = " \
      #   movies.title ILIKE :query \
      #   OR movies.syllabus ILIKE :query \
      #   OR directors.first_name ILIKE :query \
      #   OR directors.last_name ILIKE :query \
      # "
      # sql_query = " \
      #   movies.title @@ :query \
      #   OR movies.syllabus @@ :query \
      #   OR directors.first_name @@ :query \
      #   OR directors.last_name @@ :query \
      # "
      # @movies = Movie.joins(:director).where(sql_query, query: "%#{params[:query]}%" )
      @movies = Movie.global_search(params[:query])
    else
      @movies = Movie.all
    end
  end
end
