class SpellsController < ApplicationController
  def index
    if params[:class_filter]
      spell_query = SpellFilterBuilder.new({klass: Spell}, params)
      @spells = Kaminari.paginate_array(spell_query.perform).page(params[:page]).per(50)
    else
      @spells = Spell.all.page params[:page]
    end
    @class_list = Spell::CLASSES
  end

  def show
    @spell = Spell.find(params[:id])
  end

end
