class AddColumnsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :name, :string
    add_column :users, :sex, :string
    add_column :users, :date_of_birth, :date
    add_column :users, :languages_spoken, :text
    add_column :users, :languages_learn, :text
    add_column :users, :city, :string
    add_column :users, :state, :string
    add_column :users, :country, :string
    add_column :users, :picture, :string
    add_column :users, :bio, :text
  end
end
