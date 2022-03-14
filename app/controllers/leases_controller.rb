class LeasesController < ApplicationController
    validates :rent, presence: true, numericality: {only_integer: true}
end
