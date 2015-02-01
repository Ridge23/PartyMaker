class AddCountryIdToEvent < ActiveRecord::Migration
  def change
    add_column :events, :country_id, :integer
  end
end
