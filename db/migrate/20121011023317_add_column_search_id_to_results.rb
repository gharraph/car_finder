class AddColumnSearchIdToResults < ActiveRecord::Migration
  def change
    add_column :results, :search_id, :integer
  end
end
