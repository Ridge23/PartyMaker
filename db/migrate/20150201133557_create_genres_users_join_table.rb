class CreateGenresUsersJoinTable < ActiveRecord::Migration
  def self.up
    create_table :genres_users, :id => false do |t|
      t.integer :genre_id
      t.integer :user_id
    end

    add_index :genres_users, [:genre_id, :user_id]
  end

  def self.down
    drop_table :genres_users
  end
end
