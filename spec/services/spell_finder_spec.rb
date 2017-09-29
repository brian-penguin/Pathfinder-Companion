require 'rails_helper'

RSpec.describe 'spell index can be filtered with spell finder' do
  let!(:pathfinder_class_name) { 'paladin' }
  let!(:paladin_class) do
    FactoryGirl.create(:pathfinder_class, name: pathfinder_class_name)
  end

  let!(:spell_name) { 'Level 1 Paladin Spell' }
  let!(:paladin_spell) do
    FactoryGirl.create(:spell, name: spell_name)
  end

  let!(:paladin_level) { 1 }
  let!(:spell_level) do
    SpellLevel.create(
      level: paladin_level,
      pathfinder_class: paladin_class,
      spell: paladin_spell,
    )
  end

  let!(:params) { { class_name: 'paladin' } }
  let!(:spell_finder) { SpellFinder.new(params) }

  it 'index can be filtered to show all spells of a class' do
    expect(spell_finder.perform).to match_array([paladin_spell])
  end
end
