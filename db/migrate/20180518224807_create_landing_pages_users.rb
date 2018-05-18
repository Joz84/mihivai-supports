class CreateLandingPagesUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :landing_pages_users do |t|
      t.references :user, foreign_key: true
      t.references :landing_page, foreign_key: true

      t.timestamps
    end
  end
end
