class Nomad < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :experiences
  has_many :trips

extend FriendlyId
friendly_id :name, use: [:finders, :slugged]

end
