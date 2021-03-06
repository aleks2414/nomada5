class Photo < ActiveRecord::Base
  belongs_to :experience

  has_attached_file :image, styles: { medium: "300x300>", thumb: "100x100>", large: "800x800" }
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/
end
