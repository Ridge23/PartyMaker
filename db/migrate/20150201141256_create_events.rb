class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :name
      t.text :description
      t.float :price
      t.datetime :date

      t.timestamps
    end
  end
end
