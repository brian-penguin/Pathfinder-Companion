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

def build_spell_requirements(spell_data)
  return {
    verbal:   boolean_check(spell_data[:verbal]),
    somatic:  boolean_check(spell_data[:somatic]),
    material: boolean_check(spell_data[:material]),
    focus:    boolean_check(spell_data[:focus])
  }
end

def build_class_requirements(spell_data)
  PathfinderClass.all.each do |pathfinder_class|
    if spell_data[pathfinder_class.name.to_sym] != 'NULL'
      SpellLevel.create(
        level: spell_data[pathfinder_class.name.to_sym],
        pathfinder_class: pathfinder_class,
        spell: Spell.last
      )
    end
  end
end

csv_spells = SmarterCSV.process('spell_list-01JUL2017.csv')

ActiveRecord::Base.transaction do  
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
end

puts "#{PathfinderClass.count} classes added."
puts "#{Spell.count} spells added."
puts "#{SpellLevel.count} spell level relations added."
