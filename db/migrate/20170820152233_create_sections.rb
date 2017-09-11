class CreateSections < ActiveRecord::Migration[5.0]
  def change
    create_table :sections do |t|
      t.string :name
      t.references :template, foreign_key: true
      t.boolean :is_editable
      t.boolean :is_wysiwyg
      t.integer :position

      t.timestamps
    end
  end
end
