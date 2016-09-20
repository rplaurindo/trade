module Trade
  module MeasurementUnits
    module IS
      module Decimal

        module Mass

          module PtBR

            extend self

            def word_for_acronym
              {kg: :quilo, g: :grama}
            end

          end

        end

      end
    end
  end
end

# p Trade::MeasurementUnits::IS::Decimal::Mass::PtBR.word_for_acronym
