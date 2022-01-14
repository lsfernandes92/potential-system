class Contact < ApplicationRecord
  belongs_to :kind

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
