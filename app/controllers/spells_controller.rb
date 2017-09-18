class SpellsController < ApplicationController
  def index
    if params[:search_term]
      @spells = Spell.where('name LIKE ? OR description LIKE ?',
        "%#{params[:search_term]}%", "%#{params[:search_term]}%").page params[:page]

    elsif params[:class_filter] && params[:class_filter] != 'Select a class'
      spell_query = SpellFilterBuilder.new({ klass: Spell }, params)
      @spells = Kaminari.paginate_array(spell_query.perform).page(params[:page]).per(50)
    else
      @spells = Spell.all.page params[:page]
    end

    @class_list = Spell::CLASSES.map { |klass| klass }
    @class_list.unshift('Select a class')
  end

  def show
    @spell = Spell.find(params[:id])
  end

  private

  def spell_params
    params.require(:spell).permit(:name, :description, :description_short, :search_term)
  end
end
