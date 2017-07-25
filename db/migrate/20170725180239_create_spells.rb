class CreateSpells < ActiveRecord::Migration[5.1]
  def change
    create_table :spells do |t|
      t.string :name, null: false
      t.string :school, null: false
      t.string :casting_time, null: false      

      t.string :spell_resistance
      t.string :saving_throw
      t.boolean :dismissible, default: false
      t.string :description, null: false
      t.string :description_short
      t.string :source

      t.boolean :verbal, default: false
      t.boolean :somatic, default: false
      t.boolean :material, default: false
      t.boolean :focus, default: false

      t.string :link

      t.timestamps
    end
  end
end
