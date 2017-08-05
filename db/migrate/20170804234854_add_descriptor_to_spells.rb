class AddDescriptorToSpells < ActiveRecord::Migration[5.1]
  def change
    add_column :spells, :descriptor, :string
  end
end
