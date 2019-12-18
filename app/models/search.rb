class Search < ApplicationRecord
     def contacts
        @contacts ||= find_contacts
    end
private
    def find_contacts
        contacts = Contact.order(:name)
        contacts = contacts.where("name like ?", "%#{keywords}%") if keywords.present?
        contacts = contacts.where(label: label) if label.present?
        contacts
    end
end
