class MaxContentLimit < ActiveRecord::Migration[5.0]
  def up
  	change_column :contents, :content, :text, limit: 4294967295
  end
  def down
  	change_column :contents, :content, :text, limit: 65535
  end
end
