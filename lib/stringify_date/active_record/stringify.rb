require 'active_record'
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
            self.send(
              "#{column_name}=", 
                if value.present?
                  begin
                    Time.parse(value)
                  rescue ArgumentError
                    instance_variable_set("@#{name}_invalid", true)
                  end
                else
                  ''
                end
            )
          end

          define_method "validate_#{name}" do
            errors.add(name.to_sym, I18n.t('errors.invalid')) if instance_variable_get("@#{name}_invalid")
          end

          self.send(:validate, :"validate_#{name}")

        end
      end
    end
  end
end

ActiveRecord::Base.send(:include, StringifyDate::ActiveRecord::Stringify)
