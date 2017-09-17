class ChangeNameInPosts < ActiveRecord::Migration[5.1]
  def change
    rename_column :posts, :name, :username
  end
end
