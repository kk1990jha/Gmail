class CreateEncounterTests < ActiveRecord::Migration
  def self.up
    create_table :encounter_tests do |t|
	t.integer :id
	t.string :status
      #t.timestamps
    end
  end

  def self.down
    drop_table :encounter_tests
	t.integer :id
	t.string :status
  end
end
