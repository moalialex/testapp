class CreateZones < ActiveRecord::Migration[5.1]
  def change
    create_table :zones do |t|
      t.integer :level_id
      t.string :name
      t.string :description

      t.timestamps
    end
  end
end
