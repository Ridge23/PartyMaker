class Country < ActiveRecord::Base
  default_scope { order('name ASC') }
  has_many :users
  has_many :city
  has_many :events
end
