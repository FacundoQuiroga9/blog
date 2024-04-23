# app/controllers/players_controller.rb
class PlayersController < ApplicationController
  before_action :set_player, only: [:show, :edit, :update, :destroy]

  def index
    @players = order_players(params[:order], params[:direction])
    @matches = Match.order(date: :desc).page(params[:page]).per(1)
  end

  def show
  end

  def new
    @player = Player.new
  end

  def edit
  end

  def create
    @player = Player.new(player_params)
    if @player.save
      redirect_to @player, notice: 'Jugador creado exitosamente.'
    else
      render :new
    end
  end

  def update
    if @player.update(player_params)
      redirect_to @player, notice: 'Jugador actualizado exitosamente.'
    else
      render :edit
    end
  end

  def destroy
    @player.destroy
    redirect_to players_url, notice: 'Jugador actualizado eliminado.'
  end

  private
    def set_player
      @player = Player.find(params[:id])
    end

    def player_params
      params.require(:player).permit(:name, :birthday, :games, :goals, :debut, :description, :photo)
    end


    def order_players(order, direction)
      direction = %w[asc desc].include?(direction) ? direction : "asc"

      case order
      when "name", "games", "goals", "debut"
        Player.all.order(order => direction)
      when "birthday"
        # Ordena directamente por la fecha de nacimiento.
        # Si 'asc' se usa, los más jóvenes (nacidos más recientemente) primero.
        # Si 'desc' se usa, los más viejos primero.
        Player.all.order(birthday: direction)
      else
        Player.all.order(:name)
      end
    end
end
