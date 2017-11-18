class CreateVariables < ActiveRecord::Migration[5.1]
  def change
    create_table :variables do |t|
      t.string :name
      t.integer :measurement_unit_id

      t.timestamps
    end
  end
end
