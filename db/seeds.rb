require "csv"

def boolean_check(value)
  return true if value == 1 else false
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
    link: spell[:linktext]
  )
end

puts "#{csv_spells.length} spells added."