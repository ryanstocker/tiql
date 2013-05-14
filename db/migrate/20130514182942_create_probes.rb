class CreateProbes < ActiveRecord::Migration
  def change
    create_table :probes do |t|
      t.references :site
      t.integer :status
      t.integer :response_time
      t.datetime :probed_at
      t.boolean :is_event

      t.timestamps
    end
  end
end
