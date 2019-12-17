class Contact < ApplicationRecord
  belongs_to :user
  has_many :touchpoints, dependent: :delete_all
  
  validates :user, presence: true
  validates :name, presence: true
end
