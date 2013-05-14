class CreateSites < ActiveRecord::Migration
  def change
    create_table :sites do |t|
      t.string :endpoint
      t.integer :frequency, :default => 5
      t.boolean :enabled, :default => true

      t.timestamps
    end
  end
end
