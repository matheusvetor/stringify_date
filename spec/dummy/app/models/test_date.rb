class TestDate < ActiveRecord::Base
  stringify :start_at, format: "%d/%m/%Y"
  stringify :end_at, format: "%d/%m/%Y %H:%M:%S"
end
