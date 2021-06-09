class Cat < ApplicationRecord

    COLORS = ['black', 'white', 'orange', 'brown']
    validates :birth_date, :color, :name, :sex, presence: true
    validates :sex, inclusion: ["M", "F"]
    validates :color, inclusion: COLORS 


end
