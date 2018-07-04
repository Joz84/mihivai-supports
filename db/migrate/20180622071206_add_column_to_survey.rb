class AddColumnToSurvey < ActiveRecord::Migration[5.2]
  def change
    add_column :surveys, :hidden, :boolean
  end
end
