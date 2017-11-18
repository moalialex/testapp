class CreateZoneVariables < ActiveRecord::Migration[5.1]
  def change
    create_table :zone_variables do |t|
      t.integer :zone_id
      t.integer :variable_id
      t.boolean :controllable
      t.integer :min_value
      t.integer :max_value
      t.integer :value
      t.integer :actual_value

      t.timestamps
    end
  end
end
