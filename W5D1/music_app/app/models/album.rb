# == Schema Information
#
# Table name: albums
#
#  id         :bigint(8)        not null, primary key
#  title      :string           not null
#  band_id    :integer          not null
#  is_live    :boolean          default(FALSE)
#  year       :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Album < ApplicationRecord

  has_many :track,
  primary_key: :id,
  foreign_key: :album_id,
  class_name: :Track

  belongs_to :band,
  primary_key: :id,
  foreign_key: :band_id,
  class_name: :Band

end
