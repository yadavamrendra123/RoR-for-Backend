# db/migrate/20230803123456_add_profile_picture_to_users.rb (Timestamp will be different)

class AddProfilePictureToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :profile_picture, :string
  end
end
