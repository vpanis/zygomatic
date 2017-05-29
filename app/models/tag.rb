class Tag < ApplicationRecord
  belongs_to :skit
  belongs_to :category
end
