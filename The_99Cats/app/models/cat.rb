class Cat < ApplicationRecord
    COLORS = ['orange', 'black', 'grey']
    validates :birth_date, :name, :description, presence: true
    validates :color, inclusion: COLORS, presence: true
    validates :sex, inclusion: ['M', 'F'], presence: true 
end