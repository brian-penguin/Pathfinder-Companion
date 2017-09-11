spell_hash = {
  verbal:   ([true, false].sample),
  somatic:  ([true, false].sample),
  material: ([true, false].sample),
  focus:    ([true, false].sample)
}

class_hash = {
  alchemist: [rand(10), nil].sample,
  antipaladin: [rand(10), nil].sample,
  bard: [rand(10), nil].sample,
  bloodrager: [rand(10), nil].sample,
  cleric: [rand(10), nil].sample,
  druid: [rand(10), nil].sample,
  hunter: [rand(10), nil].sample,
  inquisitor: [rand(10), nil].sample,
  investigator: [rand(10), nil].sample,
  magus: [rand(10), nil].sample,
  medium: [rand(10), nil].sample,
  mesmerist: [rand(10), nil].sample,
  occultist: [rand(10), nil].sample,
  oracle: [rand(10), nil].sample,
  paladin: [rand(10), nil].sample,
  psychic: [rand(10), nil].sample,
  ranger: [rand(10), nil].sample,
  shaman: [rand(10), nil].sample,
  skald: [rand(10), nil].sample,
  sorcerer: [rand(10), nil].sample,
  spiritualist: [rand(10), nil].sample,
  summoner: [rand(10), nil].sample,
  witch: [rand(10), nil].sample,
  wizard: [rand(10), nil].sample
}

FactoryGirl.define do
  factory :spell do
    sequence(:name) { |n| "Spell 0#{n}" }
    school "conjuration"
    descriptor "mind"
    casting_time "1 round"
    range "60 ft"
    duration "12 seconds"
    targets "living creature"
    spell_resistance "no"
    saving_throw "Will (negates)"
    dismissible false
    sequence(:description) { |n| "Spell 0#{n} description full length" }
    sequence(:description_short) { |n| "Spell 0#{n} shorter description" }
    source "CORE"
    spell_requirements spell_hash
    class_requirements class_hash
  end
end
