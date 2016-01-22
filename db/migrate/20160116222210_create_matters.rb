class CreateMatters < ActiveRecord::Migration
  def change
    create_table :matters do |t|
      t.string :name

      t.timestamps null: false
    end
  end
end
