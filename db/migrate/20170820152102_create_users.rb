class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.string :name
      t.string :alias
      t.string :college
      t.boolean :is_active
      t.boolean :is_admin

      t.timestamps
    end
  end
end
