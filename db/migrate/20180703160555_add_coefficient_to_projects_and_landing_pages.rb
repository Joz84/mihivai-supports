class AddCoefficientToProjectsAndLandingPages < ActiveRecord::Migration[5.2]
  def change
    add_column :projects, :coefficient, :integer
    add_column :landing_pages, :coefficient, :integer
    add_column :surveys, :coefficient, :integer
  end
end
