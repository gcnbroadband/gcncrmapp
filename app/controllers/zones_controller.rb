class ZonesController < ApplicationController
	layout 'zones'
  def index
    @zone = Zone.all
  end

  def new
    if (current_user.gcn_admin == true) || (current_user.branch_manager == true) 
  	   @zone = Zone.new
    else
      redirect_to root_path
    end
  end

  def create
  	@zone = Zone.new(zone_params)
  	if @zone.save
  		flash[:success] = "Zone successfully created"
  		redirect_to zones_path
  	else
  		render @zone
  	end

  end

  private
  def zone_params
  	params.require(:zone).permit(:user_id,:zone_code,:zone_name,:district,:state)
  end
end
