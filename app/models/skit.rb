class Skit < ApplicationRecord
  acts_as_taggable
  # acts_as_taggable_on :name

  has_attachment :picture
  belongs_to :comedian
  has_many :reviews, dependent: :destroy
  has_many :playlist_skits
  has_many :playlists, through: :playlist_skits

  def self.search(search)
    joins(:comedian).where("lower(skits.category) LIKE ? OR lower(skits.name) LIKE ? OR lower(comedians.name) LIKE ?", "%#{search.downcase}%", "%#{search.downcase}%", "%#{search.downcase}%")
  end
end



# def self.search(search)
#     where("lower(category) LIKE ? OR lower(name) LIKE ? OR lower(skit.comedian.name)", "%#{search.downcase}%", "%#{search.downcase}%" )
#   end

 # def self.search(search)
 #    joins(:comedian).where("lower(skits.name) LIKE ? OR lower(comedians.name) LIKE ?", "%#{search.downcase}%", "%#{search.downcase}%")
 #  end