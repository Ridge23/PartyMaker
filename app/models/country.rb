class Country < ActiveRecord::Base
  has_many :users
  has_many :city
  has_many :events
end
