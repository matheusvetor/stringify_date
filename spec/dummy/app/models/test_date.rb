class TestDate < ActiveRecord::Base
  stringify :start_at, format: "%d/%m/%Y"
  stringify :end_at, format: "%d/%m/%Y %H:%M:%S"
  stringify :published_at
end
