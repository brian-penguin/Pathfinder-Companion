require 'rails_helper'

RSpec.describe 'spell index can be filtered' do
  let(:spell_name) { 'Level 1 Paladin Spell' }
  let(:paladin_level) { 1 }
  let!(:paladin_spell) do
    FactoryGirl.create(
      :spell,
      name: spell_name,
      class_requirements: {
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
        paladin: paladin_level,
        psychic: nil,
        ranger: nil,
        shaman: 1,
        skald: nil,
        sorcerer: nil,
        spiritualist: nil,
        summoner: nil,
        witch: nil,
        wizard: nil,
      },
    )
  end

  let(:params) { { class_filter: :paladin } }
  let(:spell_finder) { SpellFinder.new(params) }

  it 'index can be filtered to show all spells of a class' do
    expect(spell_finder.perform).to match_array([paladin_spell])
  end

  context 'with a specific level' do
    let(:paladin_level) { 2 }
    let(:params) { { class_filter: :paladin, level: 2 } }
    let(:out_of_scope_spell_level) { 1 }
    let(:out_of_scope_spell) do
      FactoryGirl.create(
        :spell,
        name: spell_name,
        class_requirements: {
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
          paladin: out_of_scope_spell_level,
          psychic: nil,
          ranger: nil,
          shaman: 1,
          skald: nil,
          sorcerer: nil,
          spiritualist: nil,
          summoner: nil,
          witch: nil,
          wizard: nil,
        },
      )
    end

    it 'index can be filtered to show spells of a specific level and class' do
      # Use match_array when we are doing postgres queries that might not return in the same order
      # (When there's no scope or order by explicitly set)
      expect(spell_finder.perform).to match_array([paladin_spell])
    end
  end
end
