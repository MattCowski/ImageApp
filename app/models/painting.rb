class Painting < ActiveRecord::Base
	validates_presence_of :name
  after_update :crop_image
	# before_create :default_name
  # attr_accessible :gallery_id, :name, :image
  attr_accessor :crop_x, :crop_y, :crop_w, :crop_h, :stored_image
  # belongs_to :gallery
  mount_uploader :image, ImageUploader

  def crop_image
    image.recreate_versions! if crop_x.present?
  end
# To be used for jquery multi file uploader:
	def default_name
	  self.name ||= File.basename(image.filename, '.*').titleize if image
	end
end

