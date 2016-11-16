class CustomersController < ApplicationController
  layout 'custom'

  def search
    @customer = Customer.search(params[:search_params])
    if @customer
      render partial: "look_up"
    else
      render status: not_found, nothing: true
    end
  end
  def search_complaint
    @customer = Customer.search(params[:search_params])
    if @customer
      render partial: "complaints/complaint_lookup"
    else
      render status: not_found, nothing: true
    end
  end

  def search_active_customer
    @customer = Customer.search(params[:search_params])
    if @customer
      render partial: "active_customer_lookup"
    else
      render status: not_found, nothing: true
    end
  end

  def active_customers
    if current_user.marketing_executive == true
      @customer = current_user.customers
    elsif current_user.gcn_admin == true 
      @customer = Customer.all
    elsif (current_user.gcn_admin == true) || (current_user.branch_manager == true) || (current_user.marketing_team_lead == true ) || (current_user.technical_team_lead) || (current_user.tele_caller_team_lead) || (current_user.tele_caller == true) || (current_user.technician == true)
      @customer = Customer.find_by_zone_id(current_user.zone_id)
    end
  end

  def inactive_customers
    if current_user.marketing_executive == true
      @customer = current_user.customers
    elsif current_user.gcn_admin == true 
      @customer = Customer.all
    elsif (current_user.gcn_admin == true) || (current_user.branch_manager == true) || (current_user.marketing_team_lead == true ) || (current_user.technical_team_lead) || (current_user.tele_caller_team_lead) || (current_user.tele_caller == true) || (current_user.technician == true)
      @customer = Customer.find_by_zone_id(current_user.zone_id)
    end
  end

  def search_inactive_customer
    @customer = Customer.search(params[:search_params])
    if @customer
      render partial: "inactive_customer_lookup"
    else
      render status: not_found, nothing: true
    end
  end

  def activate 
    if (current_user.gcn_admin == true) || (current_user.branch_manager == true) || (current_user.marketing_team_lead == true ) || (current_user.tele_caller_team_lead) || (current_user.tele_caller == true)
      @customer = Customer.find(params[:id])
      render layout: "compliant"
    else
      redirect_to root_path
      flash[:danger] = "Access Denied"
    end
  end
  def myrenewal 
    @customer = Customer.find(params[:id])
    # render layout: "customerdashbord"
  end
  def active
    # render plain: params[:customer][:net_plan]
      @plan = Plan.find_by_rate(params[:customer][:net_plan])
      @customer = Customer.find(params[:id])
      @customer.net_plan = @plan.plan_pattern
      # render plain: @customer.net_plan
      if @customer.update(activate_params)
        flash[:success] = "Customer is activated successfully"
        redirect_to root_path
      else
        flash[:success] = "something went wrong"
        render 'activate'
      end
  end
  def complaint_list
    @customer = Customer.find(params[:id])
  end
  def index
    if current_user.marketing_executive == true
      @customer = current_user.customers
    elsif current_user.gcn_admin == true 
      @customer = Customer.order("id DESC")
    elsif (current_user.gcn_admin == true) || (current_user.branch_manager == true) || (current_user.marketing_team_lead == true ) || (current_user.technical_team_lead) || (current_user.tele_caller_team_lead) || (current_user.tele_caller == true) || (current_user.technician == true)
      @customer = Customer.find_by_zone_id(current_user.zone_id)
    end
  end
  def complain
    @customer = Customer.find(params[:id])
    @complaints = Complaint.order("id DESC")
  end
  def new
    if (current_user.gcn_admin == true) || (current_user.branch_manager == true) || (current_user.marketing_team_lead == true) || (current_user.marketing_executive == true)
      @customer = Customer.new
      @customer.build_payment_detail
      @customer.bill_books.build
    else
      flash[:danger] = "Access Denied"
      redirect_to root_path
    end
  end

  def show
    @customer = Customer.find(params[:id])
    # @complaints = Complaint.all
    @bill = BillBook.new()
    # render layout: "customerdashbord"
  end
  def payment_detail
    @customer = Customer.find(params[:id])
    @bill = BillBook.new()
    # render layout: "customerdashbord"
  end
  def create
    #render plain: params[:customer][:payment_detail_attributes][:total_amount]
    @customer = Customer.new(customer_params)
    @customer.user = current_user
    zone = current_user.zone_id
    @customer.zone_id = zone
    arr = params[:customer][:bill_books_attributes].map { |k, v| v["bill_amount"]}

    @customer.bill_books.each do |bill|
      bill.user = current_user
      bill.pending_bill = (params[:customer][:payment_detail_attributes][:total_amount].to_i - arr[0].to_i)
    end
    if @customer.save
      flash[:success] = "Customer successfully created"
      redirect_to root_path
    else
      render 'new'
    end
  end

  def edit
    if (current_user.gcn_admin == true)
      @customer = Customer.find(params[:id])
    end
  end

  def update
    if (current_user.gcn_admin == true)
      @customer = Customer.update(customer_params)
      redirect_to root_path
    else
      flash[:danger] = "Access denied"
    end
  end

  def destroy
  end

  def import
      Customer.import(params[:file])
      redirect_to root_url, notice: "plans imported."
  end

  private

  def customer_params
    params.require(:customer).permit(:date,:zone_id,:name,:date_of_birth,:billing_address,:pin_no,:billing_mobile_no,
      :billing_email,:billing_telephone_no,:nationality,:installation_address,:installation_pin_no,:installation_telephone_no,
      :installation_mobile_no,:installation_email,:net_plan,:address_proof,:address_proof_type,:address_proof_no,
      :identity_proof,:identity_proof_type,:identity_proof_no,
      payment_detail_attributes: [:plan_cost, :plan_tax, :monthly_payment_cost,:id, :no_of_months_paid,
      :installation_charge, :company_material_use, :company_material_cost, :total_amount, :pending_amount ],
      bill_books_attributes: [:bill_book_date,:bill_book_no,:bill_no,:bill_amount, :bill_paid_by])
  end

  def activate_params
    params.require(:customer).permit(:cust_id, :activation_date, payment_detail_attributes: [:plan_cost, :plan_tax, :monthly_payment_cost,:id, :no_of_months_paid,
      :installation_charge, :company_material_use, :company_material_cost, :total_amount, :pending_amount ])
    
  end
end

