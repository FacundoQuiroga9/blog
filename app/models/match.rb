class Match < ApplicationRecord
  has_many :match_players, dependent: :destroy
  has_many :players, through: :match_players

  has_many :match_scorers, dependent: :destroy
  has_many :scorers, through: :match_scorers, source: :player

  accepts_nested_attributes_for :match_scorers, allow_destroy: true, reject_if: proc { |attributes| attributes['player_id'].blank? }
end
