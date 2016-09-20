lib = File.expand_path('../../../../../../lib/pt_br', __FILE__)
# p lib
$LOAD_PATH.unshift(lib)

require "trade/measurement_units/is/decimal/mass/pt_br"
require "trade/measurement_units/is/decimal/volume/pt_br"

module Trade
  module MeasurementUnits
    module IS
      module Decimal

        module PtBR

          extend self

          def humanize value, unit_type
            decimal = ::MeasurementUnits::IS::Decimal

            case unit_type.to_sym.downcase
              when :volume then
                if value < 1
                  "#{decimal.to_units_after(value, 3).to_f.formated} #{weight_units[:ml]}"
                else
                  if value === 1 || value < 2
                    unit = weight_units[:l]
                  else
                    unit = pluralize weight_units[:l]
                  end

                  "#{(value.to_f).formated} #{unit}"
                end
              when :mass then
                value = decimal.to_units_after value, 3

                if value < 2
                  "#{value} #{weight_units[:g]}"
                elsif value < 1000
                  "#{value} #{pluralize weight_units[:g]}"
                else
                  if value === 1000 || value < 2000
                    unit = weight_units[:kg]
                  else
                    unit = pluralize weight_units[:kg]
                  end
                  "#{(value.to_f/1000).formated} #{unit}"
                end
            end
          end

          private

            def pluralize str
              "#{str}s"
            end

            def weight_units
              Decimal::Mass::PtBR.word_for_acronym.merge Decimal::Volume::PtBR
                .word_for_acronym
            end

        end

      end
    end
  end
end
