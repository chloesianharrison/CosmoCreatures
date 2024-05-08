class PlaytimesController < ApplicationController
  def new
    @playtime = Playtime.new
    @creature = Creature.find(params[:creature_id])
  end

  def create
    @playtime = Playtime.new(playtime_params)
    @playtime.save
    redirect_to creatures_path(@playtime)
  end

  private

  def playtime_params
    params.require(:playtime).permit(:start_date, :end_date)
  end
end
