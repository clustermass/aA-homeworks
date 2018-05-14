# == Schema Information
#
# Table name: tracks
#
#  id         :bigint(8)        not null, primary key
#  album_id   :integer          not null
#  title      :string           not null
#  is_bonus   :boolean          default(FALSE)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Track < ApplicationRecord
  validates :album_id, :title, :is_bouns, presence: true
  
  belongs_to :album,
  primary_key: :id,
  foreign_key: :album_id,
  class_name: :Album

  belongs_to :band,
  through: :album,
  source: :band

end
