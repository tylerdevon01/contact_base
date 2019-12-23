class Touchpoint < ApplicationRecord
  belongs_to :user
  belongs_to :contact

  validates :description, presence: true
  #validates :type, presence: true
end
