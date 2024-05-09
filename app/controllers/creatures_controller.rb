class CreaturesController < ApplicationController
  def show
    @creature = Creature.find(params[:id])
    @playtime = Playtime.new
  end

  def index
    @creatures = Creature.all
  end

  def new
    @creature = Creature.new
  end

  def create
    @creature = Creature.new(creature_params)
    @creature.user = current_user
    if @creature.save
      redirect_to creatures_path
    else
      render :new
    end
  end

  private

  def creature_params
    params.require(:creature).permit(:planet_location, :name, :details, :price, :photo)
  end
end
