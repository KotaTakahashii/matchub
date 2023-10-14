class CreateRecruits < ActiveRecord::Migration[6.1]
  def change
    create_table :recruits do |t|
      t.datetime :datetime
      t.string :level
      t.string :comment
      t.string :status
      t.string :place
      t.datetime :start_time

      t.timestamps
    end
  end
end
