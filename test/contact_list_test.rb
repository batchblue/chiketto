require 'test_helper'

class ContactListTest < MiniTest::Test
  USER_ID = 72013652427
  CONTACT_LIST_ID = 411987

  def test_contact_list_exposes_data
    contact_list = Chiketto::ContactList.new
    assert_respond_to contact_list, :name
  end

  def test_contact_list_has_contacts
    contact_list = Chiketto::ContactList.new({ id: CONTACT_LIST_ID, user_id: USER_ID })
    VCR.use_cassette 'contact-list-contacts' do
      assert_kind_of Chiketto::Contact, contact_list.contacts.first
    end
  end

  def test_contact_list_without_user_id_contacts_raises_error
    contact_list = Chiketto::ContactList.new({ id: CONTACT_LIST_ID })
    assert_raises Chiketto::Exception do
      contact_list.contacts
    end
  end
end
