class Playlist < ApplicationRecord
  belongs_to :user
  has_many :playlist_skits, dependent: :destroy
end
