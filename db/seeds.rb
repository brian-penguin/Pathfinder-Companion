require "csv"

def boolean_check(value)
  return true if value == 1 else false
end

def null_check(value)
  return value if value != "NULL" else nil
end

def build_requirements(spell)
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

csv_spells = SmarterCSV.process('spell_list-01JUL2017.csv')

csv_spells.each do |spell|
  Spell.create(
    name: spell[:name],
    school: spell[:school],
    casting_time: spell[:casting_time],
    spell_resistance: spell[:spell_resistence], # the csv has a typo lol
    saving_throw: spell[:saving_throw],
    dismissible: boolean_check(spell[:dismissible]),
    description: spell[:description],
    description_short: spell[:short_description],
    source: spell[:source],
    verbal:   boolean_check(spell[:verbal]),
    somatic:  boolean_check(spell[:somatic]),
    material: boolean_check(spell[:material]),
    focus:    boolean_check(spell[:focus]),
    spell_requirements: build_requirements(spell)
  )
end

puts "#{csv_spells.length} spells added."