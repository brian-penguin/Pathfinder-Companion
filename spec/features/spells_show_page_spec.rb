require "rails_helper"

RSpec.describe "spells show page displays spell information" do
  let!(:spell) do
    FactoryGirl.create(
      :spell, spell_requirements: {
        verbal:   true,
        somatic:  true,
        material: false,
        focus:    true
      }
    )
  end

  scenario "spell show page links back to index" do
    visit "/spells/#{spell.id}"
    expect(page).to have_link("Back to Spells")
  end

  scenario "spell show page displays relevant spell information" do
    visit "/spells/#{spell.id}"

    expect(page).to have_content(spell.name)
    expect(page).to have_content(spell.school)
    expect(page).to have_content(spell.source)

    expect(page).to have_content(spell.casting_time)
    expect(page).to have_content(spell.range)
    expect(page).to have_content(spell.duration)
    expect(page).to have_content(spell.targets)
    expect(page).to have_content(spell.spell_resistance)
    expect(page).to have_content(spell.saving_throw)
    expect(page).to have_content(spell.dismissible)

    expect(page).to have_content(spell.description)
  end

  scenario "spell show page displays spell requirements" do
    visit "/spells/#{spell.id}"
    expect(page).to have_content("V, S, F")
  end

  pending "spell show page displays class level requirements"

  pending "spell show page links to a filtered spell page for a specific class"

end
