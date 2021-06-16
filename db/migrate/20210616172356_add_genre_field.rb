class AddGenreField < ActiveRecord::Migration[6.1]
  def change
    # add_column (a method)  :name_of_table, :attribute_name, :data_type
    add_column :articles, :genre, :string
    # created_at and updated_at are magic fields that rails are tracking
  end
end
