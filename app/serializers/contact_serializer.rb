class ContactSerializer < ActiveModel::Serializer
  belongs_to :kind do
    link(:related) { contact_kind_url(object.id) }
  end
  has_many :phones do
    link(:related) { contact_phones_url(object.id) }
  end
  has_one :address do
    link(:related) { contact_address_url(object.id) }
  end

  attributes :id, :name, :email, :birthdate

  link(:self) { contact_url(object) }

  meta do
    {
      api_author: {
        name: 'Lucas Fernandes',
        email: 'lsfernandes92@gmail.com',
        portifolio: 'https://lsfernandes92.github.io/portifolio/'
      }
    }
  end

  def attributes(*args)
    h = super(*args)
    h[:birthdate] = (I18n.l(object.birthdate) unless object.birthdate.blank?)
    h
  end
end
