class CreatePapers < ActiveRecord::Migration[5.0]
  def change
    create_table :papers do |t|
      t.string :name
      t.references :template, foreign_key: true
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
