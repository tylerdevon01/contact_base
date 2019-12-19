class Deal < ApplicationRecord
    has_and_belongs_to_many :contacts
    has_and_belongs_to_many :pipelines
    belongs_to :company, optional: true
end
