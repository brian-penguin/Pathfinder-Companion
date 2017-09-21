PathfinderClass::CLASSES.each do |class_name|
  PathfinderClass.create(name: class_name)
end

def boolean_check(value)
  if value == 1
    return true
  else
    return false
  end
end

# def null_check(value)
#   if value != "NULL"
#     return value
#   end
# end

# def build_class_requirements(spell)
#   return {
#     alchemist: null_check(spell[:alchemist]),
#     antipaladin: null_check(spell[:antipaladin]),
#     bard: null_check(spell[:bard]),
#     bloodrager: null_check(spell[:bloodrager]),
#     cleric: null_check(spell[:cleric]),
#     druid: null_check(spell[:druid]),
#     hunter: null_check(spell[:hunter]),
#     inquisitor: null_check(spell[:inquisitor]),
#     investigator: null_check(spell[:investigator]),
#     magus: null_check(spell[:magus]),
#     medium: null_check(spell[:medium]),
#     mesmerist: null_check(spell[:mesmerist]),
#     occultist: null_check(spell[:occultist]),
#     oracle: null_check(spell[:oracle]),
#     paladin: null_check(spell[:paladin]),
#     psychic: null_check(spell[:psychic]),
#     ranger: null_check(spell[:ranger]),
#     shaman: null_check(spell[:shaman]),
#     skald: null_check(spell[:skald]),
#     sorcerer: null_check(spell[:sor]),
#     spiritualist: null_check(spell[:spiritualist]),
#     summoner: null_check(spell[:summoner]),
#     witch: null_check(spell[:witch]),
#     wizard: null_check(spell[:wiz])
#   }
# end

def build_class_requirements(spell_data)
  # needs to cycle through all classes and create spell level models
  # that are tied to the most recently created spell (use Spell.last)

  # PathfinderClass::CLASSES.each do |class_name|
  PathfinderClass.all.each do |klass|
    if spell_data[klass.name.to_sym] != 'NULL'
      # binding.pry
      SpellLevel.create(
        level: spell_data[klass.name.to_sym],
        pathfinder_class: klass,
        spell: Spell.last
      )
    end
  end

end

def build_spell_requirements(spell_data)
  return {
    verbal:   boolean_check(spell_data[:verbal]),
    somatic:  boolean_check(spell_data[:somatic]),
    material: boolean_check(spell_data[:material]),
    focus:    boolean_check(spell_data[:focus])
  }
end

csv_spells = SmarterCSV.process('spell_list-01JUL2017.csv')

csv_spells.each do |spell_data|
  Spell.create(
    name: spell_data[:name].downcase,
    school: spell_data[:school],
    descriptor: spell_data[:descriptor],
    casting_time: spell_data[:casting_time],
    range: spell_data[:range],
    duration: spell_data[:duration],
    targets: spell_data[:targets],
    spell_resistance: spell_data[:spell_resistence], # the csv has a typo lol
    saving_throw: spell_data[:saving_throw],
    dismissible: boolean_check(spell_data[:dismissible]),
    description: spell_data[:description],
    description_short: spell_data[:short_description],
    source: spell_data[:source],
    spell_requirements: build_spell_requirements(spell_data)
  )

  build_class_requirements(spell_data)
end

puts "#{PathfinderClass.count} classes added."
puts "#{Spell.count} spells added."
puts "#{SpellLevel.count} spell level relations added."
