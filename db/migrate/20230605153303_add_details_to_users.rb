class AddDetailsToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :name, :string
    add_column :users, :image, :string
    add_column :users, :activeday, :string
    add_column :users, :activeplace, :string
    add_column :users, :achievement, :string
  end
end
