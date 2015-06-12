require 'test_helper'

class UserTest < MiniTest::Test
  def setup
    stub_users_me

    @user = Chiketto::User.find
  end

  def test_exposes_data
    @user = Chiketto::User.new
    assert_respond_to @user, :id
    assert_respond_to @user, :name
    assert_respond_to @user, :email
    assert_respond_to @user, :first_name
    assert_respond_to @user, :last_name
  end

  def test_find_without_id
    assert_kind_of Chiketto::User, @user
  end

  def test_find_with_id
    stub_users_id

    @user = Chiketto::User.find USER_ID
    assert_kind_of Chiketto::User, @user
  end

  def test_user_has_emails
    assert_kind_of Array, @user.emails
    assert_kind_of Chiketto::Email, @user.emails.first
  end

  def test_user_has_events
    stub_user_events

    assert_kind_of Chiketto::Event, @user.events.first
  end

  def test_user_has_event_attendees
    stub_user_attendees

    assert_kind_of Chiketto::Attendee, @user.event_attendees.first
  end

  def test_user_has_organizers
    stub_user_organizers

    assert_kind_of Chiketto::Organizer, @user.organizers.first
  end

  def test_user_has_contact_lists
    stub_user_contact_lists

    assert_kind_of Chiketto::ContactList, @user.contact_lists.first
  end

  def test_user_find_contact_list_returns_contact_list
    stub_user_contact_list

    assert_kind_of Chiketto::ContactList, @user.find_contact_list(CONTACT_LIST_ID)
  end

  def test_create_contact_list
    stub_user_create_contact_list

    contact_list = @user.create_contact_list({
      'contact_list.name' => 'Test Contact List Creation'
    })
    assert_kind_of Chiketto::ContactList, contact_list
  end
end
