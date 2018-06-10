class AddRatingToLandingPages < ActiveRecord::Migration[5.2]
  def change
    add_column :landing_pages, :rating, :float
  end
end
