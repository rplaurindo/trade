lib = File.expand_path('../../../../../../lib/trade', __FILE__)
p lib
$LOAD_PATH.unshift(lib)

require "measurement_units/is/decimal"
require "measurement_units/is/decimal/mass/pt_br"
require "measurement_units/is/decimal/volume/pt_br"

module Trade
  module MeasurementUnits
    module IS
      module Decimal

        module PtBR

          extend self

          # o volume dos produtos são armazenados em suas respectivas maiores unidades, se mensurado como massa, é guardado em quilo, se como volume, em litro, logo, se o valor for menor que 1 deve ser mostrado em ml ou grama. O problema se encontra ao fazer alterações remotamente, de forma que na caixa de texto o valor deva aparecer convertido de forma que apareça cono sua menor unidade, e noutro lugar também, porém, neste outro lugar, ao usar o método "humanize", atualmente ele entende que se o valor for maior que 1, então deve ser mostrado como sua maior unidade.

          def humanize value, unit, decide = true
            decimal = ::MeasurementUnits::IS::Decimal
            unit_type = Decimal.unit_type unit

            case unit_type.to_sym.downcase
              when :volume then
                if value < 1
                  return "#{decimal.to_units_after(value, 3).to_f.formated} #{weight_units[:ml]}"
                else
                  if value === 1 || value < 2
                    unit = weight_units[:l]
                  else
                    unit = pluralize weight_units[:l]
                  end
                end if decide

                "#{(value.to_f).formated} #{unit}"
              when :mass then
                value = decimal.to_units_after value, 3

                if value < 2
                  return "#{value} #{weight_units[:g]}"
                elsif value < 1000
                  "#{value} #{pluralize weight_units[:g]}"
                else
                  if value === 1000 || value < 2000
                    unit = weight_units[:kg]
                  else
                    unit = pluralize weight_units[:kg]
                  end
                end if decide

                "#{(value.to_f/1000).formated} #{unit}"
            end

          end

          # def humanize value, unit
          #   decimal = ::MeasurementUnits::IS::Decimal
          #   unit_type = Decimal.unit_type unit

          #   case unit_type.to_sym.downcase
          #     when :volume then
          #       if value < 1
          #         "#{decimal.to_units_after(value, 3).to_f.formated} #{weight_units[:ml]}"
          #       else
          #         if value === 1 || value < 2
          #           unit = weight_units[:l]
          #         else
          #           unit = pluralize weight_units[:l]
          #         end

          #         "#{(value.to_f).formated} #{unit}"
          #       end
          #     when :mass then
          #       value = decimal.to_units_after value, 3

          #       if value < 2
          #         "#{value} #{weight_units[:g]}"
          #       elsif value < 1000
          #         "#{value} #{pluralize weight_units[:g]}"
          #       else
          #         if value === 1000 || value < 2000
          #           unit = weight_units[:kg]
          #         else
          #           unit = pluralize weight_units[:kg]
          #         end
          #         "#{(value.to_f/1000).formated} #{unit}"
          #       end
          #   end
          # end

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

