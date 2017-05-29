class Review < ApplicationRecord
  belongs_to :skit
  belongs_to :user
end
