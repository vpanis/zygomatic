class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_attachment :picture
  has_many :playlists, dependent: :destroy
  has_many :reviews
  belongs_to :current_playlist, class_name: 'Playlist', foreign_key: 'current_playlist_id'
end
