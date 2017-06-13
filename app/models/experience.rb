class Experience < ActiveRecord::Base
  belongs_to :nomad
  has_many :photos
  has_many :reviews

	validates :vista, :inclusion => 1..10
	validates :oido, :inclusion => 1..10
	validates :olfato, :inclusion => 1..10
	validates :tacto, :inclusion => 1..10
	validates :gusto, :inclusion => 1..10

  geocoded_by :address
  after_validation :geocode, if: :address_changed?

  def average_rating
    reviews.count == 0 ? 0 : reviews.average(:star).round(2)
  end
end
