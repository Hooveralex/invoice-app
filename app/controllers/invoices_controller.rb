class InvoicesController < ApplicationController
	# http_basic_authenticate_with name: "Alex", password: "claudine10", except: [:index, :show]

	def index
		@invoices = Invoice.all
	end

	def show
		@invoice = Invoice.find(params[:id])
		@matters = Matter.all
		@items = Item.all
		@expenses = Expense.all
		@costs = 0
		@hours = 0
		
		# Total Expenses
		@expenses.each do |expense|
			if expense.invoice_id === @invoice.id
				@costs += expense.amount 
			end
		end

		# Total Amount Owed (Owed - Expenses) and Total Hours
		@items.each do |item|
			if item.invoice_id === @invoice.id
				@hours += item.hours
			end
		end

		@owed = (@hours * 40)

	end

	def new
		@invoice = Invoice.new
	end

	def edit
		@invoice = Invoice.find(params[:id])
	end

	def download
		@invoice = Invoice.find(params[:id])
	    @items = Item.all
		@expenses = Expense.all
	    @costs = 0
		@hours = 0
		
		# Total Expenses
		@expenses.each do |expense|
			if expense.invoice_id === @invoice.id
				@costs += expense.amount 
			end
		end

		# Total Amount Owed (Owed - Expenses) and Total Hours
		@items.each do |item|
			if item.invoice_id === @invoice.id
				@hours += item.hours
			end
		end

		@owed = (@hours * 40) + (@costs || 0)

		respond_to do |format|
	      format.html
	      format.pdf do
	          render :pdf => "Alex Hoover Invoice \##{@invoice.id} (#{@invoice.start_date.to_formatted_s(:long)} - #{@invoice.end_date.to_formatted_s(:long)})",
	                 :template => 'invoices/download.html.erb'
	        end
	    end


	end

	def create
		@invoice = Invoice.new(invoice_params)

		if @invoice.save 
			redirect_to @invoice
		else
			render 'new'
		end
	end

	def update
		@invoice = Invoice.find(params[:id])

		if @invoice.update(invoice_params)
			redirect_to @invoice
		else
			render 'edit'
		end
	end

	def destroy
		@invoice = Invoice.find(params[:id])
		@invoice.destroy

		redirect_to invoices_path
	end

	private
		def invoice_params
			params.require(:invoice).permit(:start_date, :end_date)
		end
end
