class Comedian < ApplicationRecord
  has_many: :skits, dependent: :destroy

end
