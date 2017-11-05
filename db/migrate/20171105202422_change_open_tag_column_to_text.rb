class ChangeOpenTagColumnToText < ActiveRecord::Migration[5.0]
  def up
  	change_column :fields, :open_tag, :text
  	change_column :fields, :close_tag, :text
  end
  def down
  	change_column :fields, :open_tag, :string
  	change_column :fields, :close_tag, :string
  end
end
