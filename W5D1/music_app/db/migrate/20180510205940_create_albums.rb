class CreateAlbums < ActiveRecord::Migration[5.2]
  def change
    create_table :albums do |t|
      t.string :title, null: false
      t.integer :band_id, null: false
      t.boolean :is_live, default: false
      t.integer :year, null: false

      t.timestamps
    end
    add_index :albums, :title
    add_index :albums, :band_id
    add_index :albums, :is_live
    add_index :albums, :year
    add_index :albums, [:band_id,:title,:year,:is_live], unique: true
  end
end
