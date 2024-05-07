class CreaturesController < ApplicationController
<<<<<<< HEAD
  def show
    @creature = Creature.find(params[:id])
=======

  def index
    @creatures = Creature.all
  end
  
  def new
    @creature = Creature.new
  end

  def create
    @creature = Creature.new(creature_params)
    @creature.save
    redirect_to creature_path(@creature)
  end

  private

  def creature_params
    params.require(:creature).permit(:planet_location, :name, :details, :price, :user_id)
>>>>>>> dd4f5d78985bc37dd376c22cd07623ae35f44436
  end
end
