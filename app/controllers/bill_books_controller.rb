class BillBooksController < ApplicationController
  def index
  end

  def new
  end

  def show
  end

  def edit
  end

  def import
      BillBook.import(params[:file])
      redirect_to root_url, notice: "plans imported."
  end

  def create
    @bill = BillBook.new(bill_book_params)
    @bill.customer_id = params[:customer][:customer_id]
    @bill.user = current_user
    @customer = Customer.find(@bill.customer_id)
    # @customer.renewals.each do |renew|
    #     if renew = @customer.renewals.last
    #         @last_renew_amount = renew.renew_amount
    #     end
    # end
    # @customer.bill_books.each do |bill|
    #     if bill == @customer.bill_books.last 
    #         @last_bill_amount =  bill.bill_amount
    #         #render plain: renew_amount
    #     end
    # end
    # renew_amount = (@last_bill_amount.to_i - @last_renew_amount.to_i)
    # @customer.update(renewal_amount: renew_amount)

    @bill.pending_bill =  ((@customer.payment_detail.total_amount.to_i - @customer.bill_books.sum(:bill_amount)) - params[:bill_book][:bill_amount].to_i)
    
    if @bill.save
        redirect_to payment_detail_customer_path(@bill.customer)
    else
        render payment_detail_customer_path(@bill.customer)
    end
  end

  private
  def bill_book_params
      params.require(:bill_book).permit(:bill_book_no, :bill_no, :bill_amount, :bill_paid_by, :bill_book_date, :customer_id)
  end
end
