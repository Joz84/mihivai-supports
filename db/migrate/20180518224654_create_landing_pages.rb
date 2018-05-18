class CreateLandingPages < ActiveRecord::Migration[5.1]
  def change
    create_table :landing_pages do |t|
      t.text :html
      t.text :css
      t.string :title

      t.timestamps
    end
  end
end
