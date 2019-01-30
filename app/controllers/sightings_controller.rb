class SightingsController < ApplicationController
  def index
    @animal = Animal.find(params[:animal_id])
    @sightings = @animal.sightings
  end

  def show

    @sighting = Sighting.find(params[:id])
    @animal = @sighting.animal
  end

  def new
    @animal = Animal.find(params[:animal_id])
    @sighting = @animal.sightings.new
  end

  def edit
    @sighting = Sighting.find(params[:id])
    @animal = @sighting.animal
  end

  def create
    @animal = Animal.find(params[:animal_id])
    @sighting = @animal.sightings.create(sighting_params)
    redirect_to animal_path(@animal)
  end

  def update
    @sighting = Sighting.find(params[:id])
    @animal = @sighting.animal

    if @sighting.update(sighting_params)
      redirect_to animal_path(@animal)
    else
      render 'edit'
    end
  end

  def destroy
    @animal = Animal.find(params[:animal_id])
    @sighting = @animal.sightings.find(params[:id])
    @sighting.destroy
    redirect_to animal_path(@animal)
  end

private
    def sighting_params
      params.require(:sighting).permit(:date, :latitude, :longitude, :region)
    end
end
