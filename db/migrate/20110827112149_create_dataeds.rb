class CreateDataeds < ActiveRecord::Migration
  def self.up
    create_table :dataeds do |t|
      t.string :datacode
      t.string :parent
      t.string :subject
      t.string :url
      t.string :click
      t.integer :level

      t.timestamps
    end
  end

  def self.down
    drop_table :dataeds
  end
end
