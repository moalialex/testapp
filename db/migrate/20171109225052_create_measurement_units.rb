class CreateMeasurementUnits < ActiveRecord::Migration[5.1]
  def change
    create_table :measurement_units do |t|
      t.string :description
      t.string :symbol

      t.timestamps
    end
  end
end
