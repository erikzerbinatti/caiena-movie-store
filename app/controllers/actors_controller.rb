class ActorsController < ApplicationController
  before_action :set_actor, only: [:show, :edit, :update, :destroy]

  def index 
    @actors = Actor.all
  end

  def show 
    @actor = Actor.find(params[:id])
  end

  def new 
    @actor = Actor.new
    @movies = Movie.all
  end

  def create
    filtered = params.require(:actor).permit(:name, :movie_id)
    @actor = Actor.new(filtered)

    if @actor.save
      redirect_to @actor, notice: 'Actor was successfully saved'
    else
      render :new
    end
  end

  def destroy 
    @actor.destroy
    redirect_to actors_url, notice: 'Movie was successfully destroyed.'
  end

  def set_actor
    @actor = Actor.find(params[:id])
  end
end