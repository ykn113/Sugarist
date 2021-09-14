class AddUserIdToTags < ActiveRecord::Migration[5.2]
  def change
    add_column :tags, :user_id, :integer
    add_foreign_key :tags, :users
  end
end
