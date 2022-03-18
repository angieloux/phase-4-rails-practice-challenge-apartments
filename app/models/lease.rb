class Lease < ApplicationRecord
  belongs_to :apartment
  belongs_to :tenant
  validates :rent, presence: true, numericality: {only_integer: true}
  validates :apartment_id, presence: true

  # has_many :available_apartments, through: :leases, source: :leases


  # Inner join where there are vacancies on the apartment table. (where )
  # scope :available, -> {Lease.where)}


end
