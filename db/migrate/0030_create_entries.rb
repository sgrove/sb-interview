class CreateEntries < ActiveRecord::Migration
  def self.up
    create_table :entries do |t|
      t.references :user
      t.references :task
      t.integer :completion
      t.integer :attempts
      t.boolean :active

      t.timestamps      
    end
  end

  def self.down
    drop_table :entries
  end
end
