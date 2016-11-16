class PaymentDetailsController < ApplicationController

	def import
	    PaymentDetail.import(params[:file])
	    redirect_to root_url, notice: "plans imported."
	end
end
