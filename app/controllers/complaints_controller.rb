class ComplaintsController < ApplicationController
  layout 'compliant'
  def index
    @complaint = Complaint.all
  end

  def new
  	# @complaint = Complaint.new
  end

  def create
  	# render plain: params
    @customer = Customer.find_by_userid(params[:custom_id])
    if @customer
      @complaint = Complaint.new(customer_id: @customer.id, complaint_sub: params[:complaint_sub], complaint_body: params[:complaint_body][0])
      if @complaint.save
        flash[:success] = "Complaint successfully raised"
        redirect_to root_path
      end
    else
      flash[:danger] = "User could not found"
      render 'new'
    end
  end
 
  def resolve
    @complaint = Complaint.find(params[:id])
  end

  def success
     # render plain: params_complaint
     @complaint = Complaint.find(params[:id])
     @complaint.complaint_fixed_by = current_user.emp_id
     @complaint.complaint_resolve = true
     if @complaint.update(params_complaint)
      redirect_to root_path
      flash[:success] = "Complaint successsfully fixed"
     else
      flash[:danger] = "Something went wrong"
     end

  end

  def show
  end

  private
  def params_complaint
  	params.require(:complaint).permit(:complaint_sub, :complaint_body, :complaint_fixed_by, :real_issue, :closed_date)
  end
end
