class CreateLevels < ActiveRecord::Migration[5.1]
  def change
    create_table :levels do |t|
      t.integer :building_id
      t.integer :level_id_in_building

      t.timestamps
    end
  end
end
