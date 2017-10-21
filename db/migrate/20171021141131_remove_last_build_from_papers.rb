class RemoveLastBuildFromPapers < ActiveRecord::Migration[5.0]
  def change
  	remove_column :papers, :last_build, :timestamp
  end
end
