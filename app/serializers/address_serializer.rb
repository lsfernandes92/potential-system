class AddressSerializer < ActiveModel::Serializer
  belongs_to :contact
  
  attributes :id, :street, :city
end
