module V1
  class ContactSerializer < ActiveModel::Serializer
    belongs_to :kind do
      link(:related) { v1_contact_kind_url(object.id) }
    end
    has_many :phones do
      link(:related) { v1_contact_phones_url(object.id) }
    end
    has_one :address do
      link(:related) { v1_contact_address_url(object.id) }
    end

    attributes :id, :name, :email, :birthdate

    link(:self) { v1_contact_url(object) }

    meta do
      {
        api_author: {
          name: 'Lucas Fernandes',
          email: 'lsfernandes92@gmail.com',
          portifolio: 'https://lsfernandes92.github.io/portifolio/'
        }
      }
    end

    def as_json(*args)
      h = super(args)
      h[:birthdate] = object.birthdate.to_time.to_iso8601 unless object.birthdate.nil?
      h
    end
  end
end
