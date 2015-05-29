module Chiketto
  class ContactList < Resource
    attr_reader :name,
                :user_id

    def contacts
      raise Exception.new("ContactList must have an id and user_id to get its Contacts") unless id && user_id

      contacts = self.class.paginated(:contacts, id, { user_id: user_id })
      contacts.map { |c| Contact.new c }
    end

    private

    def self.find_contacts(id, params)
      user_id = params.delete(:user_id)
      get "users/#{user_id}/contact_lists/#{id}/contacts", params
    end
  end
end
