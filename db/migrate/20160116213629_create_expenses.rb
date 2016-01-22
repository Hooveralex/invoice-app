class CreateExpenses < ActiveRecord::Migration
  def change
    create_table :expenses do |t|
      t.references :invoice, index: true, foreign_key: true
      t.references :matter, index: true, foreign_key: true
      t.string :desc
      t.float :amount

      t.timestamps null: false
    end
  end
end
