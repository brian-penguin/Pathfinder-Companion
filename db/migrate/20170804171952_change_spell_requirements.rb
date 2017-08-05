class ChangeSpellRequirements < ActiveRecord::Migration[5.1]
  def change
    remove_column :spells, :verbal
    remove_column :spells, :somatic
    remove_column :spells, :material
    remove_column :spells, :focus
    add_column :spells, :spell_requirements, :jsonb
  end
end
