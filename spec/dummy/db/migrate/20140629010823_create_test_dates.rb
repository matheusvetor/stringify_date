class CreateTestDates < ActiveRecord::Migration
  def change
    create_table :test_dates do |t|
      t.date :start_at
      t.datetime :end_at
    end
  end
end
