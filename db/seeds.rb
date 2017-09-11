require "csv"

def boolean_check(value)
  if value == 1
    return true
  else
    return false
  end
end

def null_check(value)
  if value != "NULL"
    return value
  end
end

def build_class_requirements(spell)
  return {
    alchemist: null_check(spell[:alchemist]),
    antipaladin: null_check(spell[:antipaladin]),
    bard: null_check(spell[:bard]),
    bloodrager: null_check(spell[:bloodrager]),
    cleric: null_check(spell[:cleric]),
    druid: null_check(spell[:druid]),
    hunter: null_check(spell[:hunter]),
    inquisitor: null_check(spell[:inquisitor]),
    investigator: null_check(spell[:investigator]),
    magus: null_check(spell[:magus]),
    medium: null_check(spell[:medium]),
    mesmerist: null_check(spell[:mesmerist]),
    occultist: null_check(spell[:occultist]),
    oracle: null_check(spell[:oracle]),
    paladin: null_check(spell[:paladin]),
    psychic: null_check(spell[:psychic]),
    ranger: null_check(spell[:ranger]),
    shaman: null_check(spell[:shaman]),
    skald: null_check(spell[:skald]),
    sorcerer: null_check(spell[:sor]),
    spiritualist: null_check(spell[:spiritualist]),
    summoner: null_check(spell[:summoner]),
    witch: null_check(spell[:witch]),
    wizard: null_check(spell[:wiz])
  }
end

def build_spell_requirements(spell)
  return {
    verbal:   boolean_check(spell[:verbal]),
    somatic:  boolean_check(spell[:somatic]),
    material: boolean_check(spell[:material]),
    focus:    boolean_check(spell[:focus])
  }
end

csv_spells = SmarterCSV.process('spell_list-01JUL2017.csv')

csv_spells.each do |spell|
  Spell.create(
    name: spell[:name].downcase,
    school: spell[:school],
    descriptor: spell[:descriptor],
    casting_time: spell[:casting_time],
    range: spell[:range],
    duration: spell[:duration],
    targets: spell[:targets],
    spell_resistance: spell[:spell_resistence], # the csv has a typo lol
    saving_throw: spell[:saving_throw],
    dismissible: boolean_check(spell[:dismissible]),
    description: spell[:description],
    description_short: spell[:short_description],
    source: spell[:source],
    spell_requirements: build_spell_requirements(spell),
    class_requirements: build_class_requirements(spell)
  )
end

puts "#{Spell.count} spells added."
