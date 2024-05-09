class CreaturesController < ApplicationController
  def show
    @creature = Creature.find(params[:id])
    @playtime = Playtime.new
  end

  def index
    @creatures = Creature.all
    if params[:query].present?
      @creatures = @creatures.where("name ILIKE ?", "%#{params[:query]}%")
    end
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

  def owned
    @creatures = Creature.where(user_id: current_user[:id])
  end

  def edit
    @creature = Creature.find(params[:id])
  end

  def update
    @creature = Creature.find(params[:id])
    @creature.update(creature_params)
    redirect_to owned_path
  end

  def destroy
    @creature = Creature.find(params[:id])
    Creature.destroy(params[:id])
    redirect_to owned_path
  end

  private

  def creature_params
    params.require(:creature).permit(:planet_location, :name, :details, :price, :photo)
  end
end
