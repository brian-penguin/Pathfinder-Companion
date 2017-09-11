require "rails_helper"

RSpec.describe "spell index can be filtered" do
  let!(:level_1_paladin_spell) do
    FactoryGirl.create(:spell, name: "Level 1 Paladin Spell", class_requirements:
      {
        alchemist: nil,
        antipaladin: nil,
        bard: nil,
        bloodrager: nil,
        cleric: 1,
        druid: nil,
        hunter: nil,
        inquisitor: 1,
        investigator: nil,
        magus: nil,
        medium: nil,
        mesmerist: nil,
        occultist: nil,
        oracle: 1,
        paladin: 1,
        psychic: nil,
        ranger: nil,
        shaman: 1,
        skald: nil,
        sorcerer: nil,
        spiritualist: nil,
        summoner: nil,
        witch: nil,
        wizard: nil
      }
    )
  end

  it "index can be filtered to show all spells of a class" do
    params = {class_filter: :paladin}
    spell_query = SpellFilterBuilder.new({klass: Spell}, params)

    spell_query.perform

    expect(spell_query.results.include?(level_1_paladin_spell)).to eq true
  end

  it "index can be filtered to show spells of a specific level and class" do
    level_2_paladin_spell = FactoryGirl.create(:spell, name: "Level 2 Paladin Spell", class_requirements:
      {
        alchemist: nil,
        antipaladin: nil,
        bard: nil,
        bloodrager: nil,
        cleric: 1,
        druid: nil,
        hunter: nil,
        inquisitor: 1,
        investigator: nil,
        magus: nil,
        medium: nil,
        mesmerist: nil,
        occultist: nil,
        oracle: 1,
        paladin: 2,
        psychic: nil,
        ranger: nil,
        shaman: 1,
        skald: nil,
        sorcerer: nil,
        spiritualist: nil,
        summoner: nil,
        witch: nil,
        wizard: nil
      }
    )

    params = {class_filter: :paladin, level: 2}
    spell_query = SpellFilterBuilder.new({klass: Spell}, params)

    spell_query.perform

    expect(spell_query.results.include?(level_2_paladin_spell)).to eq true
    expect(spell_query.results.include?(level_1_paladin_spell)).to eq false
  end

end
