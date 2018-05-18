class RemovePromotionFromTrainings < ActiveRecord::Migration[5.1]
  def change
    remove_reference :trainings, :promotion, foreign_key: true
  end
end
