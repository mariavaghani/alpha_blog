class RemoveGenreArticles < ActiveRecord::Migration[6.1]
  def change
    remove_column :articles, :genre
  end
end
