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

  # Validation for Available Furniture (borrower_id is nil) -> is lambda 
  validates(:furniture_name, { :presence => true, if: -> { borrower_id.nil? } })
  validates(:furniture_image, { :presence => true, if: -> { borrower_id.nil? } })
  validates(:furniture_description, {:presence => true, if: -> { borrower_id.nil? } })
  validates(:owner_id, {:presence => true, if: -> { borrower_id.nil? } })


  # Validation for borrowed furniture (borrower_id is not nil) -> is lambda 
  validates(:furniture_name, { :presence => true, if: -> { borrower_id.present? } })
  validates(:furniture_image, { :presence => true, if: -> { borrower_id.present? } })
  validates(:furniture_description, {:presence => true, if: -> { borrower_id.present? } })
  validates(:owner_id, {:presence => true, if: -> { borrower_id.present? } })
  validates(:rent_start, {:presence => true, if: -> { borrower_id.present? } })
  validates(:rent_end, {:presence => true, if: -> { borrower_id.present? } })
  validates(:borrower_id, {:presence => true, if: -> { borrower_id.present? } })
end
