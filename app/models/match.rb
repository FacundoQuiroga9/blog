class Match < ApplicationRecord
  has_many :match_players, dependent: :destroy
  has_many :players, through: :match_players

  has_many :match_scorers, dependent: :destroy
  has_many :scorers, through: :match_scorers, source: :player
end
