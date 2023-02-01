class PaymentSerializer < ActiveModel::Serializer
  attributes :id, :amount_paid, :status
  has_one :club
end
