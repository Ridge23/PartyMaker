class Event < ActiveRecord::Base
  has_and_belongs_to_many :genres
  belongs_to :country
  belongs_to :city
  belongs_to :user
end
