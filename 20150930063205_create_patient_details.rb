class CreatePatientDetails < ActiveRecord::Migration
  def self.up
    create_table :patient_details do |t|
	t.integer :id
	t.integer :bed_num
	t.string :bed_name
	t.integer :encounter_id
      #t.timestamps
    end
  end

  def self.down
    drop_table :patient_details
	t.integer :id
	t.integer :bed_num
	t.string :bed_name
	t.integer :encounter_id
  end
end
