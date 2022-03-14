class Apartment < ApplicationRecord
    has_many :leases
    has_many :tenants, through: :leases 
    validates :number,
    presence: true,
    numericality: {only_integer: true} 

    # accepts_nested_attributes_for :tenants

end
