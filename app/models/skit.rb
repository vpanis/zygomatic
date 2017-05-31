class Skit < ApplicationRecord
  acts_as_taggable
  # acts_as_taggable_on :name

  has_attachment :picture
  belongs_to :comedian
  has_many :reviews, dependent: :destroy
  has_many :playlist_skits
  has_many :playlists, through: :playlist_skits

end
