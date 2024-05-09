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

  def index
    if user_signed_in?
      @playtimes = Playtime.where(current_user == :user_id)
    else
      redirect_to new_user_session_path
    end
  end

  private

  def playtime_params
    params.require(:playtime).permit(:start_date, :end_date)
  end
end
