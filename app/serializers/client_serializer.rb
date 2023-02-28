class ClientSerializer < ActiveModel::Serializer
  attributes :id, :name, :age, :total_charge_amount
  has_many :memberships

  
  def total_charge_amount
    # object.memberships.sum{ |member| member.charge }
    object.memberships.sum( &:charge )
  end
end
