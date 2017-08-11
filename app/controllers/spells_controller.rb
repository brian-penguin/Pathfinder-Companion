class SpellsController < ApplicationController
  def index
    @spells = Spell.all.page params[:page]
  end
end
