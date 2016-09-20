module Trade
  module MeasurementUnits
    module IS
      module Decimal

        module Volume

          module PtBR

            extend self

            def word_for_acronym
              {l: :litro, ml: :ml}
            end

          end

        end

      end
    end
  end
end

# p Trade::MeasurementUnits::IS::Decimal::Volume::PtBR.word_for_acronym
