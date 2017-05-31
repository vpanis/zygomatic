class Comedian < ApplicationRecord
  has_attachment :picture
  has_many :skits, dependent: :destroy

end
