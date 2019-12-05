class RenameProfileImageColumnToUsers < ActiveRecord::Migration[5.2]
  def change
  	 rename_column :users, :profile_image, :picture
  end
end
