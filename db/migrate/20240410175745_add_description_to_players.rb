class AddDescriptionToPlayers < ActiveRecord::Migration[7.1]
  def change
    add_column :players, :description, :text
  end
end
