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

  def index
    @customer = Customer.all
  end

  def new
    @customer = Customer.new
    @customer.build_payment_detail
    @customer.bill_books.build
  end

  def show
  end

  def create
    #render plain: params[:customer][:payment_detail_attributes][:total_amount]
    @customer = Customer.new(customer_params)
    @customer.user = current_user
    # @customer.zone = current_user.zone
    arr = params[:customer][:bill_books_attributes].map { |k, v| v["bill_amount"]}

    @customer.bill_books.each do |bill|
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
  end

  def destroy
  end

  private

  def customer_params
    params.require(:customer).permit(:date,:name,:date_of_birth,:billing_address,:pin_no,:billing_mobile_no,
      :billing_email,:billing_telephone_no,:nationality,:installation_address,:installation_pin_no,:installation_telephone_no,
      :installation_mobile_no,:installation_email,:net_plan,:address_proof,:address_proof_type,:address_proof_no,
      :identity_proof,:identity_proof_type,:identity_proof_no,
      payment_detail_attributes: [:plan_cost, :plan_tax, :monthly_payment_cost,:id, :no_of_months_paid,
      :installation_charge, :company_material_use, :company_material_cost, :total_amount, :pending_amount ],
      bill_books_attributes: [:bill_book_date,:bill_book_no,:bill_no,:bill_amount, :bill_paid_by])
  end
end

