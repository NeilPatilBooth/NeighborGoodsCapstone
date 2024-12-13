# == Schema Information
#
# Table name: communications
#
#  id           :bigint           not null, primary key
#  comment_body :string
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  author_id    :integer
#  furniture_id :integer
#
class Communication < ApplicationRecord
  belongs_to :author, required: true, class_name: "User", foreign_key: "author_id"
  belongs_to :furniture, required: true, class_name: "Furniture", foreign_key: "furniture_id"
end 
