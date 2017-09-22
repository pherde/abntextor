class CreateFields < ActiveRecord::Migration[5.0]
  def change
    create_table :fields do |t|
      t.string :name
      t.string :label
      t.string :open_tag
      t.string :close_tag
      t.boolean :is_multivalue
      t.integer :position
      t.references :section, foreign_key: true

      t.timestamps
    end
  end
end
