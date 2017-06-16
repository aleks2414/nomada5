class Experience < ActiveRecord::Base
  belongs_to :nomad
  belongs_to :trip
  has_many :photos, dependent: :destroy
  has_many :reviews, dependent: :destroy


  geocoded_by :address
  after_validation :geocode, if: :address_changed?

  def average_rating
    reviews.count == 0 ? 0 : reviews.average(:star).round(2)
  end

extend FriendlyId
friendly_id :title, use: [:finders, :slugged]

end
