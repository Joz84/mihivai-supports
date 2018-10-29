class AddConditionsValidationToUser < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :conditions_validation, :boolean
  end
end
