class CreaturesController < ApplicationController
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
  end
end
