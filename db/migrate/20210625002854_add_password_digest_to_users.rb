class AddPasswordDigestToUsers < ActiveRecord::Migration[6.1]
  def change
    # name of table, name of column, data type
    add_column :users, :password_digest, :string
  end
end
