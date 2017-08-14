require "rails_helper"

RSpec.describe "spells index page paginates all spells" do
  before(:all) do
    51.times do
      FactoryGirl.create(:spell)
    end    
  end

  scenario "spells 1-50 are shown on first page" do
    visit "/spells"
    expect(page).to have_content(Spell.all.first.name)
    expect(page).to_not have_content(Spell.all.last.name)
  end

  scenario "spells beyond #50 are shown on following pages" do
    visit "/spells"
    click_link "2"

    expect(page).to_not have_content(Spell.all.first.name)
    expect(page).to have_content(Spell.all.last.name)
  end

  scenario "spells index links to each individual spell" do
    visit "/spells"
    expect(page).to have_link("#{Spell.first.name}")
  end
end