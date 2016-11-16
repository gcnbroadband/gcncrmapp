class PlansController < ApplicationController
    layout 'plandashbord'
    def index
        @plan = Plan.all
    end

    def show
    end

    def new
        if (current_user.gcn_admin == true) || (current_user.branch_manager == true)
            @plan = Plan.new
        else
            redirect_to root_path
            flash[:danger] = "Access Denied"
        end
    end

    def create
        # render plain: params_plan
        @plan = Plan.new(params_plan)
        if @plan.save
            flash[:success] = "Plan successfully created"
            redirect_to plans_path
        else
            flash[:danger] = "Something went wrong"
            render 'new'
        end
    end

    def import
        Plan.import(params[:file])
        redirect_to root_url, notice: "plans imported."
    end

private

def params_plan
    params.require(:plan).permit(:plan_value, :plan_pattern)
end
end
