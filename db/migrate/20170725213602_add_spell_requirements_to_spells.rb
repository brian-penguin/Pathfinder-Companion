class AddSpellRequirementsToSpells < ActiveRecord::Migration[5.1]
  def change
    add_column :spells, :spell_requirements, :jsonb
  end
end
