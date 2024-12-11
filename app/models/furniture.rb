# == Schema Information
#
# Table name: furnitures
#
#  id                    :bigint           not null, primary key
#  comments_count        :integer
#  furniture_description :string
#  furniture_image       :string
#  furniture_name        :string
#  rent_end              :datetime
#  rent_start            :datetime
#  created_at            :datetime         not null
#  updated_at            :datetime         not null
#  borrower_id           :integer
#  owner_id              :integer
#
class Furniture < ApplicationRecord
  mount_uploader :furniture_image, FurnitureImageUploader
end
