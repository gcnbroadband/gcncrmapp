class RenewalsController < ApplicationController
    layout 'custom'
    def index
    end

    def new
        if (current_user.gcn_admin == true) || (current_user.branch_manager == true) || (current_user.tele_caller_team_lead == true) || (current_user.tele_caller == true)
            @renew = Renewal.new
        else
            redirect_to root_path
            flash[:danger] = "Access Denied"
        end
    end

    def show
    end

    def renew
        @customer = Customer.find(params[:id])
    end

    def new_renewal
        # render plain: params[:customer][:customer_id]  
        @customer = Customer.find(params[:customer][:customer_id])
        if @customer
            @plan = Plan.find_by_rate(params[:renew_plan][0])
            @renew = Renewal.new(customer_id: @customer.id, renew_date: params[:renew_date], renew_plan: @plan.plan_pattern, renew_amount: params[:renew_amount])
            if @renew.save
                flash[:success] = "#{@customer.name}, Successfully renewed"
                redirect_to myrenewal_customer_path(@customer)
            else
                flash[:danger] = "Something went wrong"
                render 'new'
            end

        else
            flash[:danger] = "Something went wrong"
            render 'new'
        end
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
