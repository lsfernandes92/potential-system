class Contact < ApplicationRecord
  belongs_to :kind
  has_many :phones
  has_one :address

  accepts_nested_attributes_for :phones, allow_destroy: true
  accepts_nested_attributes_for :address

  def as_json(options={})
    h = super(options.merge(include: [:kind, :phones, :address]))
    h[:birthdate] = (I18n.l(self.birthdate) unless self.birthdate.nil?)
    h
  end

  # def author
  #   'Hebe Camargo'
  # end
  #
  # def kind_description
  #   self.kind.description
  # end
  #
  # def as_json(options={})
  #   super(
  #     methods: [:author, :kind_description],
  #     root: true,
  #     include: :kind
  #    )
  # end
end
