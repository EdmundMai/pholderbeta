class RemoveAvatarsFromAlbums < ActiveRecord::Migration
  def up
  	remove_column :albums, :avatar_file_name
  	remove_column :albums, :avatar_content_type
  	remove_column :albums, :avatar_file_size
  	remove_column :albums, :avatar_updated_at
  end

  def down
  	add_column :albums, :avatar_file_name
  	add_column :albums, :avatar_content_type
  	add_column :albums, :avatar_file_size
  	add_column :albums, :avatar_updated_at
  end
end
