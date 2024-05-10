class PlaytimesController < ApplicationController
  def new
    @playtime = Playtime.new
    @creature = Creature.find(params[:creature_id])
  end

  def create
    @creature = Creature.find(params[:creature_id])

    date_range = params[:playtime][:start_date]
    dates = date_range.split(' to ')

    @playtime = Playtime.new(start_date: dates[0], end_date: dates[1])
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
  
end
