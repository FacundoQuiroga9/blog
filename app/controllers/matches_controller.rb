# app/controllers/matches_controller.rb
class MatchesController < ApplicationController
  before_action :set_match, only: %i[show destroy]

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
    redirect_to matches_url, notice: 'Partido eliminado exitosamente.'
  end

  private

  def set_match
    @match = Match.find(params[:id])
  end

  def match_params
    params.require(:match).permit(:rival, :result, :date, player_ids: [], scorer_ids: [])
  end

  def update_players_statistics_on_create(match)
    return unless match

    players = match.players

    players.each do |player|
      player.increment!(:games) # Incrementar partidos jugados para todos los jugadores
      player.increment!(:goals) if match.scorers.include?(player) # Incrementar goles para los goleadores del partido
    end
  end


  def update_players_statistics_on_destroy(match)
    return unless match

    players = match.players

    players.each do |player|
      player.matches.delete(match)

      total_matches = player.matches.count
      total_goals = player.matches.sum { |m| m.scorers.include?(player) ? 1 : 0 }

      player.update_columns(games: total_matches, goals: total_goals)
    end
  end



end
