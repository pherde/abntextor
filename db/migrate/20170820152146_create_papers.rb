class CreatePapers < ActiveRecord::Migration[5.0]
  def change
    create_table :papers do |t|
      t.string :name
      t.string :hash, unique: true
      t.references :template, foreign_key: true
      t.references :user, foreign_key: true
      t.timestamp :last_build
      t.timestamps
    end
    add_index :papers, :hash, unique: true
  end
end
