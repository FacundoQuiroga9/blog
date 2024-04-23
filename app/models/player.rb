# app/models/player.rb
class Player < ApplicationRecord
  has_many :match_players, dependent: :destroy
  has_many :matches, through: :match_players
  has_one_attached :photo

  validates :name, presence: true

  def update_statistics(matches)
    self.games = matches.count
    self.goals = matches.sum { |match| match.match_scorers.where(player: self).sum(:goals_count) }
    save
  end


end
