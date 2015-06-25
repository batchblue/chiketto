module Chiketto
  class Contact < Resource
    attr_reader :first_name,
                :last_name,
                :email

    attr_date :created
  end
end
