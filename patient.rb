class Patient < ActiveRecord::Base

 has_many :Patient_Test
 has_many :Visit_Test
 has_many :Encounter_Test
 has_many :Patient_Details
end
