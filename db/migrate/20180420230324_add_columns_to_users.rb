class AddColumnsToUsers < ActiveRecord::Migration[5.1]
  def change
    add_reference :users, :promotion, foreign_key: true
    add_column :users, :group, :string
    add_column :users, :description, :text
    add_column :users, :first_name, :string
    add_column :users, :last_name, :string
    add_column :users, :site, :string
    add_column :users, :linkedin, :string
  end
end
