class CreateVisitTests < ActiveRecord::Migration
  def self.up
    create_table :visit_tests do |t|
	t.integer :id
	t.integer :encounter_id
	t.integer :patient_id
	t.string :type
      #t.timestamps
    end
  end

  def self.down
    drop_table :visit_tests
	t.integer :id
	t.integer :encounter_id
	t.integer :patient_id
	t.string :type
  end
end
