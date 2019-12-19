class Deal < ApplicationRecord
    has_and_belongs_to_many :contacts
    belongs_to :company, optional: true
end
