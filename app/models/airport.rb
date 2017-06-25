class Airport < ActiveRecord::Base

geocoded_by :name
after_validation :geocode, if: :name_changed?

end
