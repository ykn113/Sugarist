class AddTagNameToTag < ActiveRecord::Migration[5.2]
  def change
    add_column :tags, :tag_name, :string
  end
end
