class Event < ActiveRecord::Base
  has_and_belongs_to_many :genres
  belongs_to :country
  belongs_to :city
  belongs_to :user

  has_attached_file :image, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/images/:style/no_image.jpg"
  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/

end
