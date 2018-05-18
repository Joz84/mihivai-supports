class CreatePromotionsTrainings < ActiveRecord::Migration[5.1]
  def change
    create_table :promotions_trainings do |t|
      t.references :promotion, foreign_key: true
      t.references :training, foreign_key: true

      t.timestamps
    end
  end
end
