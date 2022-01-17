class Contact < ApplicationRecord
  belongs_to :kind

  def to_br
    {
      name: self.name,
      email: self.email,
      birthdate: (I18n.l(self.birthdate) unless self.birthdate.nil?)
    }
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
