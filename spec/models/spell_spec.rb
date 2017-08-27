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
        description: "The target laughs as a swift action on their next turn.",
        description_short: "Target laughs as a swift action next round",
        source: "Earth",
        spell_requirements: {
          verbal:   true,
          somatic:  true,
          material: false,
          focus:    false
        },
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
          paladin: nil,
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

    expect(good_spell.save).to eq true
  end

  it "spell not created if incorrect attributes provided" do
    bad_spell = Spell.new(
      name: "Freeze Bean",
      school: "freezy",
      descriptor: "wicked cold",
      casting_time: "20 minutes",
      range: "too far",
      duration: "20 seconds",
      targets: "living creature",
      spell_resistance: "no",
      saving_throw: "none",
      dismissible: false,
      description: "You shoot a big cold bean",
      description_short: "cold. brean.",
      source: "China",
      spell_requirements: {
        verbal:   nil,
        somatic:  true,
        material: false,
        focus:    false
      },
      class_requirements: {
        alchemist: 0,
        antipaladin: "yes",
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
        paladin: nil,
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

    expect(bad_spell.save).to eq false
  end

end
