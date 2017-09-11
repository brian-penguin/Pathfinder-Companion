require 'rails_helper'

RSpec.describe "Spell creation", type: :model do
  it "spell created with valid attributes provided" do
    good_spell = Spell.new(
        name: "Abra Kadabra",
        school: "conjuration",
        descriptor: "mind",
        casting_time: "1 round",
        range: "10 ft",
        duration: "2 seconds",
        targets: "living creature",
        spell_resistance: "no",
        saving_throw: "none",
        dismissible: false,
        description: "Gripped by the caster's foolish magic attempt, the target laughs as a swift action on their next turn.",
        description_short: "Target laughs as a swift action next round",
        source: "Earth",
        spell_requirements: {
          verbal:   true,
          somatic:  true,
          material: false,
          focus:    false
        },
        class_requirements: @class_requirements_template
    )
    expect(good_spell.save).to eq true
  end

  it "spell not created if incorrect attributes provided" do
    bad_spell = FactoryGirl.build(:spell)
    bad_spell.school = 'bad school'

    expect(bad_spell.save).to eq false
  end

  it "#list_spell_requirements returns correct initials" do
    good_spell = FactoryGirl.build(:spell)
    good_spell.spell_requirements = {
      verbal:   true,
      somatic:  true,
      material: false,
      focus:    false
    }

    expect(good_spell.list_spell_requirements).to eq("v, s")
  end

end
