class CreateMatches < ActiveRecord::Migration[7.1]
  def change
    create_table :matches do |t|
      t.string :rival
      t.string :result
      t.date :date

      t.timestamps
    end
  end
end
