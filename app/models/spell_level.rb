class SpellLevel < ApplicationRecord
  belongs_to :pathfinder_class
  belongs_to :spell
end
