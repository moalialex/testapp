# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

buildings = ['B1', 'B2', 'B3', 'B4', 'B5'].map { |b| Building.where(name: b).first_or_create }

measurement_units = [
  ['Water mass per cube meter', ''],
  ['Cellesiuos', 'C'],
  ['Fehrenhite', 'F'],
  ['Kilo Watt', 'KW'],
  ['Kilo Watt per Hour', 'KWh'],
  ['Ton', 'Ton'],
  ['Cost', 'SEK'],
  ['Cost', '$'],
  ['Kilo Watt per Hour in a Square Meter', 'KWh/sqm'],
  ['Ton per Square Meter', 'Ton/sqm'],
  ['Cost per Square Meter', 'SEK/sqm'],
  ['Cost per Square Meter', '$/sqm'],
  ['CMH', 'cmh'],
  ['Minute', 'min']
].map { |m| MeasurementUnit.where(description: m[0], symbol: m[1]).first_or_create }

variables = [
  ['Humidity', 1],
  ['Illuminance', nil],
  ['Presence', nil],
  ['Temperature', 2],
  ['Power Consumption', 4],
  ['DALI Light Level', nil],
  ['DALI Light Color', nil],
  ['Energy Consumption', 5],
  ['CO2', 6],
  ['Energy Cost', 7],
  ['sp Energy Consumption', 9],
  ['sp CO2', 10],
  ['sp Energy Cost', 11],
  ['Power Consumption-BI', 4],
  ['HVAC Air Flow', 13]
].map { |v| Variable.where(name: v[0], measurement_unit_id: v[1]).first_or_create }


b1Levels = [
  {level_id_in_building: 1},
  {level_id_in_building: 2}
].map { |l| Level.where(building: buildings[0], level_id_in_building: l[:level_id_in_building]).first_or_create }

b1Levels[0].diagram = File.new('app/assets/images/floor2.jpeg', 'r')
b1Levels[1].diagram = File.new('app/assets/images/floor.png', 'r')
b1Levels.each { |l| l.save }

b2Levels = [
  {level_id_in_building: 1},
  {level_id_in_building: 2}
].map { |l| Level.where(building: buildings[0], level_id_in_building: l[:level_id_in_building]).first_or_create }

b2Levels[0].diagram = File.new('app/assets/images/office.png', 'r')
b2Levels[1].diagram = File.new('app/assets/images/Mainfloor.jpg', 'r')
b2Levels.each { |l| l.save }

b1Levels[0].zones.where(name: "Zone1", diagram_x: 738, diagram_y: 504).first_or_create
b1Levels[0].zones.where(name: "Zone2", diagram_x: 1502, diagram_y: 538).first_or_create
b1Levels[0].zones.where(name: "Zone3", diagram_x: 1111, diagram_y: 783).first_or_create
b1Levels[0].zones.where(name: "Zone4", diagram_x: 700, diagram_y: 883).first_or_create
b1Levels[0].zones.where(name: "Zone5", diagram_x: 300, diagram_y: 1174).first_or_create

b2Levels[0].zones.where(name: "Office 1", diagram_x: 256, diagram_y: 322).first_or_create
b2Levels[0].zones.where(name: "Office 2", diagram_x: 153, diagram_y: 702).first_or_create
b2Levels[0].zones.where(name: "Office 3", diagram_x: 392, diagram_y: 702).first_or_create
b2Levels[0].zones.where(name: "Office 4", diagram_x: 574, diagram_y: 702).first_or_create
b2Levels[0].zones.where(name: "Office 5", diagram_x: 823, diagram_y: 702).first_or_create
b2Levels[0].zones.where(name: "Break Room", diagram_x: 619, diagram_y: 328).first_or_create
b2Levels[0].zones.where(name: "Kitchen", diagram_x: 840, diagram_y: 286).first_or_create

b2Levels[1].zones.where(name: "Conference Room 1", diagram_x: 1208, diagram_y: 154).first_or_create
b2Levels[1].zones.where(name: "Business Lounge", diagram_x: 1433, diagram_y: 412).first_or_create
b2Levels[1].zones.where(name: "Workstations", diagram_x: 2142, diagram_y: 331).first_or_create
b2Levels[1].zones.where(name: "Conference Room 2", diagram_x: 2066, diagram_y: 909).first_or_create

vs = [variables[3], variables[14]]
(b1Levels + b2Levels).map(&:zones).flatten.each do |zone|
  vs.each do |variable|
    ZoneVariable.where(zone: zone, variable: variable, controllable: 1, value: 200, max_value: 1000, min_value:100).first_or_create
  end
end