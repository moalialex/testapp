class AddDiagramCoordinatesToZones < ActiveRecord::Migration[5.1]
  def change
    add_column :zones, :diagram_x, :integer
    add_column :zones, :diagram_y, :integer
  end
end
