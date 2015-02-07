class Genre < ActiveRecord::Base
  default_scope { order('name ASC') }
  has_and_belongs_to_many :users
  has_and_belongs_to_many :events
end
