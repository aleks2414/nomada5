class Trip < ActiveRecord::Base
  belongs_to :nomad
  has_many :experiences, dependent: :destroy

extend FriendlyId
friendly_id :name, use: [:finders, :slugged]
end
