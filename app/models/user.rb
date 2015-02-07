class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable,
         :registerable,
         :recoverable,
         :rememberable,
         :trackable,
         :validatable,
         :confirmable,
         :lockable

  belongs_to :role, foreign_key: :role_id, class_name: 'Role'
  belongs_to :country
  belongs_to :city
  has_many   :events
  has_and_belongs_to_many :genres

  has_attached_file :avatar, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/images/:style/no_image.jpg"
  validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/

end
