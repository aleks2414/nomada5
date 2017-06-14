class Trip < ActiveRecord::Base
  belongs_to :nomad
  has_many :experiences, dependent: :destroy
end
