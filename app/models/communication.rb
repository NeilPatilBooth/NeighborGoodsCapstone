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
end
