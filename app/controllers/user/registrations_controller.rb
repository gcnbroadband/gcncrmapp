class User::RegistrationsController < Devise::RegistrationsController

	before_filter :configure_permitted_parameters
	# def new
	# 	super		
	# end
	# def create
	# 	render plain: params[:user]
	# 	# @designation = Designation.find(params[:user][:designation_id])
	# 	# @user = User.new
	# 	# case @designation.name
	# 	# when "Telecaller"
	# 	# 	@user.tele_caller = true	
	# 	# when "Marketing Executive"
	# 	#   	@user.marketing_executive = true
	# 	# when "Technician"
	# 	# 	@user.technician = true
	# 	# else
	# 	#   puts "Nothing assigned"
	# 	# end
	# 	# @user.save
	# 	# super
	# end
	protected

	def configure_permitted_parameters
		devise_parameter_sanitizer.for(:sign_up).push(:technician,:tele_caller,:marketing_executive,:gcn_admin,:zone_id,:designation_id,:name,:emp_id,:emp_official_mobile_no,:emp_local_addr,:date_of_birth,:blood_group,:emp_personal_mobile_no,:emp_personal_email,:emp_personal_address,:emergency_cotact_no)
		devise_parameter_sanitizer.for(:account_update).push(:zone_id,:designation_id,:name,:emp_id,:emp_official_mobile_no,:emp_official_email,:emp_local_addr,:date_of_birth,:blood_group,:emp_personal_mobile_no,:emp_personal_email,:emp_personal_address,:emergency_cotact_no)
	end
end

