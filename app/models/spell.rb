class Spell < ApplicationRecord
  SCHOOLS = [
    "abjuration",
    "conjuration",
    "divination",
    "enchantment",
    "evocation",
    "illusion",
    "necromancy",
    "transmutation",
    "universal"
  ]

  validates :name, presence: true
  validates :school, inclusion: { in: SCHOOLS }
  validates :casting_time, presence: true
  validates :source, presence: true
  validates :spell_requirements, length: { is: 4 }
  validates :class_requirements, length: { is: 24 }
    
end
