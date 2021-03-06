class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  has_many :contacts, dependent: :delete_all
  has_many :companys, dependent: :delete_all
  has_many :touchpoints, through: :contacts
  has_many :pipelines, dependent: :delete_all
  has_many :deals, dependent: :delete_all
end
