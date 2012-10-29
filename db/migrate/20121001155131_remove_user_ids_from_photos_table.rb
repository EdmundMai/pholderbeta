class RemoveUserIdsFromPhotosTable < ActiveRecord::Migration
  def up
  	remove_column :albums, :user_id
  end

  def down
  end
end
