class RenewalsController < ApplicationController
  layout 'compliant'
  def index
  end

  def new
  	@renew = Renewal.new
  end

  def show
  end

  def create
  	
  	@customer = Customer.find_by_userid(params[:custom_id])
  	if @customer
      @plan = Plan.find_by_rate(params[:renew_plan][0])
  		@renew = Renewal.new(customer_id: @customer.id, renew_date: params[:renew_date], renew_plan: @plan.plan_pattern, renew_amount: params[:renew_amount])
  		if @renew.save
  			flash[:success] = "#{@customer.name}, Successfully renewed"
  			redirect_to root_path
  		else
  			flash[:danger] = "Something went wrong"
  			render 'new'
  		end
      
  	else
  		flash[:danger] = "Wromg user id"
  		render 'new'
  	end
  	
  end
end
