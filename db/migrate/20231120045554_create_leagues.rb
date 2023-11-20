class CreateLeagues < ActiveRecord::Migration[7.1]
  def change
    create_table :leagues do |t|
      t.string :name
      t.string :location
      t.boolean :public_league

      t.timestamps
    end
  end
end
