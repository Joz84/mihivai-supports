class CreateProjects < ActiveRecord::Migration[5.1]
  def change
    create_table :projects do |t|
      t.string :url
      t.float :rating

      t.timestamps
    end
  end
end
