class CreateResults < ActiveRecord::Migration
  def change
    create_table :results do |t|
      t.string :link
      t.float :price
      t.string :sold_by

      t.timestamps
    end
  end
end
