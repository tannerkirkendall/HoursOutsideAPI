class CreateOutsideTrackers < ActiveRecord::Migration[8.0]
  def change
    create_table :outside_trackers do |t|
      t.datetime :start_time
      t.datetime :end_time
      t.string :description

      t.timestamps
    end
  end
end
