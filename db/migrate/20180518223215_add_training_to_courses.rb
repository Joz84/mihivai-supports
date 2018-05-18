class AddTrainingToCourses < ActiveRecord::Migration[5.1]
  def change
    add_reference :courses, :training, foreign_key: true
  end
end
