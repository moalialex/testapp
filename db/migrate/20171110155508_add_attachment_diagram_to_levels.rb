class AddAttachmentDiagramToLevels < ActiveRecord::Migration[5.1]
  def self.up
    change_table :levels do |t|
      t.attachment :diagram
    end
  end

  def self.down
    remove_attachment :levels, :diagram
  end
end
