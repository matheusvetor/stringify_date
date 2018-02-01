require 'active_record'
require 'active_support/concern'
require 'active_support/core_ext/array/extract_options'

module StringifyDate
  module ActiveRecord
    module Stringify
      extend ActiveSupport::Concern

      def parse_value(name, value, format)
        return nil unless value.present?

        begin
          Time.strptime(value, format)
        rescue ArgumentError
          instance_variable_set("@#{name}_invalid", true)
          nil
        end
      end

      module ClassMethods
        def stringify(field, *args)
          column_name = field.to_s
          options     = args.extract_options!
          format      = options[:format] || '%Y-%m-%d'
          name        = [column_name, 'string'].join('_')

          define_method name do
            date = send(column_name)
            date.strftime(format) if date.present?
          end

          define_method "#{name}=" do |value|
            parsed_value = parse_value(name, value, format)
            send("#{column_name}=", parsed_value)
          end

          define_method "validate_#{name}" do
            errors.add(name.to_sym, I18n.t('errors.invalid')) if instance_variable_get("@#{name}_invalid")
          end

          send(:validate, :"validate_#{name}")
        end
      end
    end
  end
end

ActiveRecord::Base.send(:include, StringifyDate::ActiveRecord::Stringify)
