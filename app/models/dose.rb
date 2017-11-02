class Dose < ApplicationRecord
  belongs_to :coktail
  belongs_to :ingredient
end
