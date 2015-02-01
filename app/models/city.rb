class City < ActiveRecord::Base
  has_many :users
  has_many :events
  belongs_to :country
end
