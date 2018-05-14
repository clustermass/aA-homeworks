class CreateTracks < ActiveRecord::Migration[5.2]
  def change
    create_table :tracks do |t|
      t.integer :album, null: false
      t.string :title, null: false
      t.boolean :is_bonus, default: false

      t.timestamps
    end
    add_index :tracks, :album
    add_index :tracks, :title
    add_index :tracks, :is_bonus
  end
end
