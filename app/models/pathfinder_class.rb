class PathfinderClass < ApplicationRecord
  has_many :spell_levels
  has_many :spells, through: :spell_levels

  CLASSES = %w(
    alchemist
    antipaladin
    bard
    bloodrager
    cleric
    druid
    hunter
    inquisitor
    investigator
    magus
    medium
    mesmerist
    occultist
    oracle
    paladin
    psychic
    ranger
    shaman
    skald
    sorcerer
    spiritualist
    summoner
    witch
    wizard
  ).freeze
end
