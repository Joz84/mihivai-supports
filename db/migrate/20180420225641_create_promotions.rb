class CreatePromotions < ActiveRecord::Migration[5.1]
  def change
    create_table :promotions do |t|
      t.references :school, foreign_key: true
      t.string :name

      t.timestamps
    end
  end
end
