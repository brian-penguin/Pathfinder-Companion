class SpellFinder
  attr_reader :class_name, :level, :page

  def initialize(params)
    @params = params
    @class_name = params[:class_name]
    @level = params[:level].try(:to_i)
    @page = params[:page]
  end

  def self.perform(params)
    new(params).perform
  end

  def perform
    if class_name.present? && level.present?
      # need to join spell_levels to spells & class
    elsif class_name.present?
      PathfinderClass.find_by(name: class_name).spells.order(:name)
      # PathfinderClass.where(name: class_name).first.spells.order(:name)
    else
      Spell.all.page(page)
    end
  end
end
