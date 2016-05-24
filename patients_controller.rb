class PatientsController < ApplicationController

	def menu
		@test = PatientTest.find(:first, 
				:conditions => "encounter_tests.status='Active' and encounter_tests.id = 1",
				:joins => "inner join visit_tests on patient_tests.id=visit_tests.id  
					   join encounter_tests on visit_tests.encounter_id=encounter_tests.id
					   join patient_details on encounter_tests.id=patient_details.encounter_id ",
				:select => "visit_tests.patient_id,visit_tests.type,patient_tests.name,patient_tests.address,patient_tests.mobile_no,
					   patient_details.bed_num,patient_details.bed_name,encounter_tests.status,encounter_tests.id")
				#raise @test.inspect
	end
	
	def create


		@find=Patient.find(:first,:conditions =>['patient_id=?',params[:patients][:id]])
		#raise @find.inspect
		@pid=Patient.find(:all,:conditions => ['patient_id=?',params[:patients][:patient_id]])
		#raise @pid.inspect
     		   if (@pid.blank? && params[:patients][:patients] == 'newuser' && !params[:patients].blank?)
			@data=Patient.new(:name => params[:patients][:name],:patient_id =>params[:patients][:patient_id],:email_id =>params[:patients][:email_id],
					:mobile_no => params[:patients][:mobile_no],:pre_addrs => params[:patients][:pre_addrs])
			@data.save
			render :action => 'menu'
		  elsif(!@find.blank? && params[:patients][:patients] == 'existinguser')
			render :action => 'show1'
		   else
			render :action => 'menu'
		   end
	end
	def show_all
		@show_all=Patient.find(:all, :select =>"name,patient_id,email_id,mobile_no,pre_addrs")	
		#raise @show_all.inspect
	end
	
	def edit
		#raise params[:Id].inspect
		@edit_data=Patient.find_by_patient_id(params[:Id])
		#raise @edit_data.inspect
	end
	def update_one
		@edit_data=Patient.find_by_patient_id(params[:Id])
		#raise @edit_data.inspect
		@edit_data.update_attributes(:name => params[:patients][:name],:patient_id =>params[:patients][:patient_id],:email_id =>params[:patients][:email_id],
					:mobile_no => params[:patients][:mobile_no],:pre_addrs => params[:patients][:pre_addrs])
		@edit_data.save
		render :action => 'show_all'
               
	end
	def delete
		#raise params.inspect
		@del_data=Patient.find_by_patient_id(params[:Id])
		#raise @del_data.inspect		
		@del_data.destroy
		redirect_to :action => 'show_all'
	
	end

	
end
