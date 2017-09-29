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
    # TODO: This can and should be cleaned up to a single composable query but I can't think of how just yet
    # it may involve abstracting out the json to a join table
    if class_name.present? && level.present?
      Spell.where('class_requirements @> ?', { class_name => level }.to_json).page(page)
    elsif class_name.present?
      Spell.where.not('class_requirements @> ?', { class_name => nil }.to_json).page(page)
    else
      Spell.all.page(page)
    end
  end
end
