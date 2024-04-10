class CreatePlayers < ActiveRecord::Migration[7.1]
  def change
    create_table :players do |t|
      t.string :name
      t.date :birthday
      t.integer :games
      t.integer :goals
      t.date :debut

      t.timestamps
    end
  end
end
