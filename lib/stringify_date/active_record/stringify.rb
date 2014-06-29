require 'active_support/concern'
require 'active_support/core_ext/array/extract_options'

module StringifyDate
  module ActiveRecord
    module Stringify
      extend ActiveSupport::Concern

      module ClassMethods
        def stringify(field, *args)
          column_name = field.to_s

          options = args.extract_options!

          name = [column_name, 'string'].join('_')

          define_method name do
            date = send(column_name)
            date.strftime(options[:format]) unless date.nil?
          end

          define_method "#{name}=" do |value|
            type = self.class.columns_hash[column_name].type
            types = { datetime: DateTime, date: Date }
            if value && type.in?([:date, :datetime])
              self.send("#{column_name}=", types[type].send('parse', value))
            end
          end
        end
      end
    end
  end
end

ActiveRecord::Base.send(:include, StringifyDate::ActiveRecord::Stringify)
