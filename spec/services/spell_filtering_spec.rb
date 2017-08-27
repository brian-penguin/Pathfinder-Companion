require "rails_helper"

RSpec.describe "spell index can be filtered" do
  before(:all) do
    51.times do
      FactoryGirl.create(:spell)
    end 
  end
  
  let(:paladin_spell) do
    FactoryGirl.create(:spell, name: "Paladin Spell", class_requirements: 
    class_requirements: {
      alchemist: 0,
      antipaladin: 0,
      bard: 0,
      bloodrager: nil,
      cleric: 0,
      druid: 0,
      hunter: nil,
      inquisitor: 0,
      investigator: 0,
      magus: 0,
      medium: 0,
      mesmerist: nil,
      occultist: 0,
      oracle: 0,
      paladin: 1,
      psychic: nil,
      ranger: nil,
      shaman: 0,
      skald: 0,
      sorcerer: 0,
      spiritualist: nil,
      summoner: 0,
      witch: 0,
      wizard: nil
    }
  )
  end
  
  scenario "index can be filtered by class" do  
    visit "/"
    select "Paladin", from: "class_list"

    expect(page).to have_link(paladin_spell.name)
  end

end