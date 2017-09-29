spell_hash = {
  verbal:   [true, false].sample,
  somatic:  [true, false].sample,
  material: [true, false].sample,
  focus:    [true, false].sample,
}

FactoryGirl.define do
  factory :spell do
    sequence(:name) { |n| "Spell 0#{n}" }
    school 'conjuration'
    descriptor 'mind'
    casting_time '1 round'
    range '60 ft'
    duration '12 seconds'
    targets 'living creature'
    spell_resistance 'no'
    saving_throw 'Will (negates)'
    dismissible false
    sequence(:description) { |n| "Spell 0#{n} description full length" }
    sequence(:description_short) { |n| "Spell 0#{n} shorter description" }
    source 'CORE'
    spell_requirements spell_hash
  end
end
