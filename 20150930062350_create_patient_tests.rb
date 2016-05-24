class CreatePatientTests < ActiveRecord::Migration
  def self.up
    create_table :patient_tests do |t|
	t.integer :id
	t.string :name
	t.string :address
	t.string :mobile_no

      #t.timestamps
    end
  end

  def self.down
    drop_table :patient_tests
	t.integer :id
	t.string :name
	t.string :address
	t.string :mobile_no

  end
end
