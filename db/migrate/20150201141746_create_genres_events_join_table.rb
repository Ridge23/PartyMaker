class CreateGenresEventsJoinTable < ActiveRecord::Migration
  def self.up
    create_table :events_genres, :id => false do |t|
      t.integer :genre_id
      t.integer :event_id
    end

    add_index :events_genres, [:genre_id, :event_id]
  end

  def self.down
    drop_table :events_genres
  end
end
