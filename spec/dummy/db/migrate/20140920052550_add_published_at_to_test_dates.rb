class AddPublishedAtToTestDates < ActiveRecord::Migration
  def change
    add_column :test_dates, :published_at, :date
  end
end
