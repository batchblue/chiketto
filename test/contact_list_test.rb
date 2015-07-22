require 'test_helper'

class ContactListTest < MiniTest::Test
  USER_ID = 56727857661
  CONTACT_LIST_ID = 859438

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

  def test_contact_list_add_contact_returns_true
    contact_list = Chiketto::ContactList.new({ id: CONTACT_LIST_ID, user_id: USER_ID })
    params = { "contact.email" => "foo@bar.com", "contact.first_name" => "foo", "contact.last_name" => "bar" }
    VCR.use_cassette 'contact-list-add-contact' do
      assert_kind_of TrueClass, contact_list.add_contact(params)
    end
  end

  def test_contact_list_without_user_id_add_contact_raises_error
    contact_list = Chiketto::ContactList.new({ id: CONTACT_LIST_ID })
    assert_raises Chiketto::Exception do
      contact_list.add_contact({})
    end
  end

  def test_contact_list_delete_contact_returns_true
    contact_list = Chiketto::ContactList.new({ id: CONTACT_LIST_ID, user_id: USER_ID })
    VCR.use_cassette 'contact-list-delete-contact' do
      assert_kind_of TrueClass, contact_list.delete_contact("foo@bar.com")
    end
  end

  def test_contact_list_without_user_id_delete_contact_raises_error
    contact_list = Chiketto::ContactList.new({ id: CONTACT_LIST_ID })
    assert_raises Chiketto::Exception do
      contact_list.delete_contact("")
    end
  end
end
