# app/controllers/matches_controller.rb
class MatchesController < ApplicationController
  before_action :set_match, only: %i[show destroy]

  def index
    if params[:start_date].present?
      start_date = Date.parse(params[:start_date]).beginning_of_month
    else
      start_date = Date.today.beginning_of_month
    end

    end_date = start_date.end_of_month

    @matches = Match.where(date: start_date..end_date)
  end


  def show

  end

  def new
    @match = Match.new
  end

  def create
    @match = Match.new(match_params)

    if @match.save
      update_players_statistics_on_create(@match)
      redirect_to @match, notice: 'Partido creado exitosamente.'
    else
      render :new
    end
  end




  def destroy
    update_players_statistics_on_destroy(@match)
    @match.destroy
    redirect_to players_url, notice: 'Partido eliminado exitosamente.'
  end

  private

  def set_match
    @match = Match.find(params[:id])
  end

  def match_params
    params.require(:match).permit(
      :rival, :result, :date, player_ids: [],
      match_scorers_attributes: [:id, :player_id, :goals_count, :_destroy]
    )
  end


  def update_players_statistics_on_create(match)
    return unless match

    players = match.players
    players.each do |player|
      player.increment!(:games) # Incrementar partidos jugados para todos los jugadores
      goals_count = match.match_scorers.where(player: player).sum(:goals_count)
      player.increment!(:goals, goals_count) if goals_count > 0 # Sumar la cantidad de goles específicos
    end
  end


  def update_players_statistics_on_destroy(match)
    return unless match

    players = match.players

    players.each do |player|
      player.decrement!(:games) # Decrementar partidos jugados
      goals_count = match.match_scorers.where(player: player).sum(:goals_count)
      player.decrement!(:goals, goals_count) if goals_count > 0 # Restar la cantidad de goles específicos
    end

    match.destroy # Asegúrate de eliminar el partido después de actualizar las estadísticas
  end



end
