class Spell < ApplicationRecord
  has_many :spell_levels
  has_many :pathfinder_classes, through: :spell_levels

  SCHOOLS = %w(
    abjuration
    conjuration
    divination
    enchantment
    evocation
    illusion
    necromancy
    transmutation
    universal
  ).freeze

  validates :name, presence: true
  validates :school, inclusion: { in: SCHOOLS }
  validates :casting_time, presence: true
  validates :source, presence: true
  validates :dismissible, inclusion: { in: [true, false] }
  validates :description, presence: true
  validates :spell_requirements, length: { is: 4 }
  # validates :class_requirements, length: { is: 24 }

  validate :validate_spell_requirements
  # validate :validate_class_requirements

  def validate_spell_requirements
    self.spell_requirements.values.each do |req_value|
      if ![true, false].include?(req_value)
        errors.add("Spell requirements", "All values for the spell requirements must be true or false.")
      end
    end
  end

  def validate_class_requirements
    self.class_requirements.values.each do |req_value|
      if req_value.class != Integer && req_value != nil
        errors.add(
          'requirements',
          'All values for the class requirements must be an integer or nil.',
        )
      end
    end
  end
  
  def list_spell_requirements
    display = ""
    spell_requirements.each do |requirement, value|
      if value
        display << requirement[0]
      end
    end

    
    display = if display.include?("f")
                display.split("").sort.reverse!
              else
                display.split("")
              end

    display.join(", ")
  end
end
