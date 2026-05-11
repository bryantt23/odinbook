class RenameCommentToTextInComment < ActiveRecord::Migration[8.0]
  def change
    rename_column :comments, :comment, :content
  end
end
