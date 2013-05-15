class ChangeResponseTimeToFlaot < ActiveRecord::Migration
  def change
    change_column :probes, :response_time, :float
  end
end
