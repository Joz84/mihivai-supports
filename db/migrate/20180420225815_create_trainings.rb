class CreateTrainings < ActiveRecord::Migration[5.1]
  def change
    create_table :trainings do |t|
      t.references :promotion, foreign_key: true
      t.text :resume
      t.string :name

      t.timestamps
    end
  end
end
