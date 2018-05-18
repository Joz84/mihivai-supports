class DropTrainingCourses < ActiveRecord::Migration[5.1]
  def change
    drop_table :training_courses do |t|
      t.string :position
      t.references :training, foreign_key: true
      t.references :course, foreign_key: true
      t.time :time

      t.timestamps
    end
  end
end
