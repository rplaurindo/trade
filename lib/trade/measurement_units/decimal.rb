module Trade
  module MeasurementUnits
    module Decimal

      extend self

      module Volume

        extend self

        def units_pattern
          /\b(l|ml)\b/
        end

      end

      module Mass

        extend self

        def units_pattern
          /\b(kg|g)\b/
        end

      end

      def unit_type unit
        case unit.downcase.to_s
          when Volume.units_pattern; :volume
          when Mass.units_pattern; :mass
        end
      end

    end
  end
end
