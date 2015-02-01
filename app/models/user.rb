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
  has_and_belongs_to_many :genres

end
