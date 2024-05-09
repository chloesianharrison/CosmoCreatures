class PlaytimesController < ApplicationController
  def new
    @playtime = Playtime.new
    @creature = Creature.find(params[:creature_id])
  end

  def create
    @creature = Creature.find(params[:creature_id])
    @playtime = Playtime.new(playtime_params)
    @playtime.user = current_user
    @playtime.creature = @creature
    if @playtime.save
      redirect_to playtimes_path
    else
      render :new
    end
  end

  def index
    if user_signed_in?
      @playtimes = Playtime.where(user_id: current_user[:id])
    else
      redirect_to new_user_session_path
    end
  end

  private

  def playtime_params
    params.require(:playtime).permit(:start_date)
  end
end
