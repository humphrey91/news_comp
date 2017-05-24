class Screenshot < ApplicationRecord
  belongs_to :domain
  mount_uploader :filename, ImageUploader


  
end
