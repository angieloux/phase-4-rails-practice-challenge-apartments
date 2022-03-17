class Tenant < ApplicationRecord
    has_many :leases, dependent: :destroy
    has_many :apartments, through: :leases
    validates :age, presence: true, numericality: {only_integer: true, greater_than_or_equal_to: 18}
    validates :name, presence: true
    accepts_nested_attributes_for :apartments
end
