class ContactSerializer < ActiveModel::Serializer
  belongs_to :kind do
    link(:related) { kind_url(object.kind.id) }
  end
  has_many :phones
  has_one :address

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

  def as_json(*args)
    h = super(args)
    h[:birthdate] = object.birthdate.to_time.to_iso8601 unless object.birthdate.nil?
    h
  end
end
