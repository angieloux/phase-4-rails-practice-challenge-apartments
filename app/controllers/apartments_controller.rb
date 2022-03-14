class ApartmentsController < ApplicationController
    validates :number, presence: true, numericality: {only_integer: true} 
end
