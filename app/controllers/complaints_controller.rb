class ComplaintsController < ApplicationController
  layout 'compliant'
  def index
    @complaint = Complaint.all
  end

  def new
  	# @complaint = Complaint.new
  end

  def create
  	# render plain: params[:custom_id]
    @customer = Customer.find_by_userid(params[:custom_id])
    if @customer
      @complaint = Complaint.new(customer_id: @customer.id, complaint_sub: params[:complaint_sub], complaint_body: params[:complaint_body])
      if @complaint.save
        flash[:success] = "Complaint successfully raised"
        redirect_to root_path
      end
    else
      flash[:danger] = "User could not found"
      render 'new'
    end
  end

  def show
  end

  private
  def params_complaint
  	params.require(:complaint).permit(:complaint_sub, :complaint_body)
  end
end
