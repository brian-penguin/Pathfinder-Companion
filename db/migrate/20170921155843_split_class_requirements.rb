class SplitClassRequirements < ActiveRecord::Migration[5.1]
  def change
    remove_column :spells, :class_requirements

    create_table :pathfinder_class do |t|
      t.string :name, null: false

      t.timestamps
    end

    create_table :spell_levels do |t|
      t.integer :level, null: false

      t.references :spell, foreign_key: true
      t.references :classes, foreign_key: true

      t.timestamps
    end
  end
end
