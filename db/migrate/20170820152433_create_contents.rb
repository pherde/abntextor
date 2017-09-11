class CreateContents < ActiveRecord::Migration[5.0]
  def change
    create_table :contents do |t|
      t.references :paper, foreign_key: true
      t.references :field, foreign_key: true
      t.text :content

      t.timestamps
    end
  end
end
