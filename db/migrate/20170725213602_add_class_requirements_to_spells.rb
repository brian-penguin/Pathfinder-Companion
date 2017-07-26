class AddClassRequirementsToSpells < ActiveRecord::Migration[5.1]
  def change
    add_column :spells, :class_requirements, :jsonb
  end
end
