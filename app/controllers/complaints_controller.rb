class ComplaintsController < ApplicationController
  layout 'compliant'
  def index
    @complaints = Complaint.order("id DESC")
  end
  
  def open_complaint
    @complaints = Complaint.order("id DESC")
  end

  def close_complaint
    @complaints = Complaint.order("id DESC")
  end

  def new
  	# @complaint = Complaint.new
  end
  def assign_complaint
    if (current_user.gcn_admin == true) || (current_user.branch_manager == true) || (current_user.tele_caller_team_lead == true) || (current_user.tele_caller == true) 
      @customer = Customer.all
    else
      redirect_to root_path
      flash[:danger] = "Access denied"
    end
  end
  def create_custom
     # @complaint = Complaint.find(params[:id])
     @customer =  Customer.find(params[:id])
  end

  def create
  	# render plain: params[:customer][:customer_id]
    @customer = Customer.find(params[:customer][:customer_id])
    # render json: @customer
    if @customer
      @complaint = Complaint.new(customer_id: @customer.id, complaint_sub: params[:complaint_sub], complaint_body: params[:complaint_body][0])
      @complaint.user = current_user
      if @complaint.save
        redirect_to complaints_path
        flash[:success] = "Ticket no is - #{@complaint.ticket}"
      end
    else
      flash[:danger] = "User could not found"
      render 'new'
    end
  end
 
  def resolve
   if (current_user.gcn_admin == true) || (current_user.branch_manager == true) || (current_user.tele_caller_team_lead == true)
      @complaint = Complaint.find(params[:id])
      @emp = User.all
      @users = User.find_all_technician()
   else
      redirect_to complaints_path 
      flash[:danger] = "Access denied"
   end  
  end

  def success
     # render plain: params_complaint
     @complaint = Complaint.find(params[:id])
     @complaint.complaint_closed_by = current_user.id
     # render json: @complaint
     @complaint.complaint_resolve = true
     if @complaint.update(params_complaint)
      redirect_to complaints_path
      flash[:success] = "Complaint successsfully fixed"
     else
      render 'resolve'
      flash[:danger] = "Something went wrong"
     end

  end

  def show
    @complaint = Complaint.find(params[:id])
  end

  private
  def params_complaint
  	params.require(:complaint).permit(:complaint_sub, :complaint_body, :complaint_fixed_by, :real_issue, :closed_date)
  end
end
