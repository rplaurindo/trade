lib = File.expand_path('../../../../../../lib/trade', __FILE__)
# p lib
$LOAD_PATH.unshift(lib)

require "measurement_units/is/decimal"
require "measurement_units/is/decimal/mass/pt_br"
require "measurement_units/is/decimal/volume/pt_br"

# lib = File.expand_path('../../../../../../../measurement_units/lib/measurement_units', __FILE__)
# $LOAD_PATH.unshift(lib)
# require "is/decimal"

module Trade
  module MeasurementUnits
    module IS
      module Decimal

        module PtBR

          extend self

          def humanize value, unit, decide = true
            decimal = ::MeasurementUnits::IS::Decimal
            unit_type = Decimal.unit_type unit

            case unit_type.to_sym.downcase
              when :volume then
                if value < 1
                  value = decimal.to_units_after(value, 3) if decide
                  unit = weight_units[:ml]
                elsif value < 2
                  unit = weight_units[:l]
                else
                  unit = pluralize weight_units[:l]
                end

                value = value.to_f.formated
                "#{value} #{unit}"
              when :mass then
                value = decimal.to_units_after value, 3 if decide

                if value < 2
                  unit = weight_units[:g]
                elsif value < 1000
                  unit = pluralize weight_units[:g]
                else
                  if value < 2000
                    unit = weight_units[:kg]
                  else
                    unit = pluralize weight_units[:kg]
                  end

                  value = (value.to_f/1000).formated
                end

                "#{value} #{unit}"
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

# p Trade::MeasurementUnits::IS::Decimal::PtBR.humanize 0.1, :volume, false
# p Trade::MeasurementUnits::IS::Decimal::PtBR.humanize 0.1, :volume

# p Trade::MeasurementUnits::IS::Decimal::PtBR.humanize 0.1, :mass, false
# p Trade::MeasurementUnits::IS::Decimal::PtBR.humanize 0.1, :mass
