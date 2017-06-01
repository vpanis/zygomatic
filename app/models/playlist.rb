class Playlist < ApplicationRecord
  belongs_to :user
  has_many :playlist_skits, dependent: :destroy
  has_many :skits, through: :playlist_skits
end
