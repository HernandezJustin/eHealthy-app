class DropDirectionsTable < ActiveRecord::Migration
  def change
    drop_table :directions
  end
end
