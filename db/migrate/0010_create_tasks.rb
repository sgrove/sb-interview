class CreateTasks < ActiveRecord::Migration
  def self.up
    create_table :tasks do |t|
      t.string :group
      t.string :name
      t.integer :level

      t.timestamps
    end
  end

  def self.down
    drop_table :tasks
  end
end
