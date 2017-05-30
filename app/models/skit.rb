class Skit < ApplicationRecord
  belongs_to :comedian
  has_many :reviews, dependent: :destroy
  has_many :playlist_skits
  has_many :playlists, through: :playlist_skits
end
