class ChangeTrackFieldToAlbumId < ActiveRecord::Migration[5.2]
  def change
    rename_column :tracks, :album, :album_id
  end
end
