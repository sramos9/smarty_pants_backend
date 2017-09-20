class ChangeNameInComments < ActiveRecord::Migration[5.1]
  def change
    rename_column :comments, :name, :username
  end
end
