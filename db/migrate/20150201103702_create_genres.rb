class CreateGenres < ActiveRecord::Migration
  def change
    create_table :genres do |t|
      t.string :name
      t.boolean :enabled

      t.timestamps
    end
  end
end
