class SpellsController < ApplicationController
  def index
    @spells = Spell.all.page params[:page]
  end

  def show
    @spell = Spell.find(params[:id])
  end
end
