class CreatePatients < ActiveRecord::Migration
  def self.up
    create_table :patients do |t|
	t.string :name
	t.string :patient_id
	t.string :email_id
	t.text :mobile_no
	t.text :pre_addrs
     # t.timestamps
    end
  end

  def self.down
    drop_table :patients
	t.string :name
	t.string :patient_id
	t.string :email_id
	t.text :mobile_no
	t.text :pre_addrs
  end
end
