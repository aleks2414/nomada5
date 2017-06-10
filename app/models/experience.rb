class Experience < ActiveRecord::Base
  belongs_to :nomad
  has_many :photos
end
