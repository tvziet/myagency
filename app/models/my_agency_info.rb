# == Schema Information
#
# Table name: my_agency_infos
#
#  id              :bigint           not null, primary key
#  address         :string
#  email           :string
#  english_address :string
#  facebook_link   :string
#  facebook_name   :string
#  phone_number    :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#
class MyAgencyInfo < ApplicationRecord
  # Attributes
  has_one_attached :logo
  has_one_attached :qr_image
end
