class AddColumnDisplayableToSearches < ActiveRecord::Migration
  def change
    add_column :searches, :displayable, :bool
  end
end
