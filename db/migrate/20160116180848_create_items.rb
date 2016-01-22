class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.references :invoice, index: true, foreign_key: true
      t.references :matter, index: true, foreign_key: true
      t.date :date
      t.string :desc
      t.float :hours

      t.timestamps null: false
    end
  end
end
