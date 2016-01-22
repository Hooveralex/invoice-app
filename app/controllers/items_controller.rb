class ItemsController < ApplicationController
	# http_basic_authenticate_with name: "Alex", password: "claudine10", only: :destroy

	def create
		@invoice = Invoice.find(params[:invoice_id])
	    @item = @invoice.items.create(item_params)
	    redirect_to request.referer
	end

	def destroy
		@invoice = Invoice.find(params[:invoice_id])
		@item = @invoice.items.find(params[:id])
		@item.destroy

		redirect_to request.referer
	end

	private
		def item_params
			params.require(:item).permit(:date, :matter_id, :desc, :hours)
		end
end
