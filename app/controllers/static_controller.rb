class StaticController < ApplicationController
  def index
  	@invoices = Invoice.all.reverse
    @items = Item.all
    @expenses = Expense.all
  end

  def today
  	@today = Date.today
  	@today_format = @today.to_formatted_s(:long)
  	@invoices = Invoice.all
  	@matters = Matter.all

  	@items = Item.where("date=?", Date.today).all

  	@invoices.each do |invoice|
  		range = invoice.start_date..invoice.end_date
  		if range.include?(@today)
  			@invoice = Invoice.find(invoice.id)
  		end
  	end

    @costs = 0
    @hours = 0


    # Total Amount Owed (Owed - Expenses) and Total Hours
    @items.each do |item|
      if item.invoice_id === @invoice.id
        @hours += item.hours
      end
    end

    @owed = (@hours * 40) + (@costs || 0)
  end
end
