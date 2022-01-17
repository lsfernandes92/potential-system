class PhoneSerializer < ActiveModel::Serializer
  belongs_to :contact, optional: true
  
  attributes :id, :number
end
