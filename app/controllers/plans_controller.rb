class PlansController < ApplicationController
  layout 'plandashbord'
  def index
    @plan = Plan.all
  end

  def show
  end

  def new
  	@plan = Plan.new
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

  def params_plan
    params.require(:plan).permit(:plan_value, :plan_pattern)
  end
end
