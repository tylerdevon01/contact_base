class Contact < ApplicationRecord
  belongs_to :user
  has_many :touchpoints, dependent: :delete_all
  has_and_belongs_to_many :pipelines
  
  validates :user, presence: true
  validates :name, presence: true
end
