class AddGoalsCountToMatchScorers < ActiveRecord::Migration[7.1]
  def change
    add_column :match_scorers, :goals_count, :integer, default: 1
  end
end
