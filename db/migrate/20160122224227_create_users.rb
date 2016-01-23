class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.float :rate
      t.string :address
      t.string :address2
      t.string :city
      t.string :state
      t.integer :zip

      t.timestamps null: false
    end
  end
end
