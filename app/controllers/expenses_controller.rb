class ExpensesController < ApplicationController
	# http_basic_authenticate_with name: "Alex", password: "claudine10", only: :destroy

	def create
		@invoice = Invoice.find(params[:invoice_id])
		@expense = @invoice.expenses.create(expense_params)
	    redirect_to invoice_path(@invoice)
	end

	def destroy
		@invoice = Invoice.find(params[:invoice_id])
		@expense = @invoice.expenses.find(params[:id])
		@expense.destroy

		redirect_to invoice_path(@invoice)
	end

	private
		def expense_params
			params.require(:expense).permit(:matter_id, :desc, :amount)
		end
end
