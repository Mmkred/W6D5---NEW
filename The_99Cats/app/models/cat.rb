class Cat < ApplicationRecord
    COLORS = ['orange', 'black', 'grey']
    validates :birth_date, :name, :description, presence: true
    validates :color, inclusion: COLORS, presence: true
    validates :sex, inclusion: ['M', 'F'], presence: true 

    has_many :cat_rental_requests, 
        class_name: :CatRentalRequest,
        foreign_key: :cat_id,
        dependent: :destroy
end