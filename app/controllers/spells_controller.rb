class SpellsController < ApplicationController
  def index
    @spells = SpellFinder.perform(spells_params)
    @class_list = PathfinderClass::CLASSES
  end

  def show
    @spell = Spell.find(params[:id])
  end

  private

  def spells_params
    params.permit(:class_name, :level, :page)
  end
end
