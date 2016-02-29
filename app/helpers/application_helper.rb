module ApplicationHelper
	def get_owed(items,invoice)
		@hours = 0
		items.each do |item|
			if item.invoice_id == invoice.id
				@hours += item.hours
			end
		end
		return @hours * 40
	end

	def get_expenses(expenses,invoice)
		@costs = 0
		expenses.each do |expense|
			if expense.invoice_id == invoice.id
				@costs += expense.amount 
			end
		end
		return @costs
	end
end
