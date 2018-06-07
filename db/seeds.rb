# Creates all the classes and spells and their respsective relationship
module Seeds
  def self.boolean_check(value)
    if value == 1
      return true
    else
      return false
    end
  end

  def self.null_check(value)
    value.present? && value != 'NULL'
  end
end

Spell.delete_all
PathfinderClass.delete_all
SpellLevel.delete_all

# csv_spells = SmarterCSV.process('spell_list-01JUL2017.csv')
csv_spells = SmarterCSV.process('spell_list_May2018.csv')

ActiveRecord::Base.transaction do

  classes = PathfinderClass::CLASSES.each_with_object([]) do |name, new_classes|
    new_classes << PathfinderClass.create(name: name)
  end

  csv_spells.each do |spell_data|
    spell = Spell.create(
      name: spell_data[:name].downcase,
      school: spell_data[:school],
      descriptor: spell_data[:descriptor],
      casting_time: spell_data[:casting_time],
      range: spell_data[:range],
      duration: spell_data[:duration],
      targets: spell_data[:targets],
      spell_resistance: spell_data[:spell_resistence], # the csv has a typo lol
      saving_throw: spell_data[:saving_throw],
      dismissible: Seeds.boolean_check(spell_data[:dismissible]),
      description: spell_data[:description],
      description_short: spell_data[:short_description],
      source: spell_data[:source],
      spell_requirements: {
        verbal:   Seeds.boolean_check(spell_data[:verbal]),
        somatic:  Seeds.boolean_check(spell_data[:somatic]),
        material: Seeds.boolean_check(spell_data[:material]),
        focus:    Seeds.boolean_check(spell_data[:focus])
      }
    )

    classes.each do |pathfinder_class|
      class_spell_level = spell_data[pathfinder_class.name.to_sym]

      if Seeds.null_check(class_spell_level)
        SpellLevel.create!(
          level: class_spell_level,
          pathfinder_class: pathfinder_class,
          spell: spell
        )
      end
    end
  end
end

puts "#{PathfinderClass.count} classes added."
puts "#{Spell.count} spells added."
puts "#{SpellLevel.count} spell level relations added."

