require_relative 'utility'
require_relative './orders/audio'
require_relative './orders/image'
require_relative './orders/video'

class Calculator
  class << self
    def run(input)
      order_commands = input.split(' ')

      Utility.validate(order_commands)

      orders = Hash[*order_commands]

      run_results(orders)
    end

    private

    def run_results(orders)
      results = []

      orders.each do |key, value|
        case value
        when "IMG"
          results << Orders::Image.new.display_results(key.to_i)
        when "VID"
          results << Orders::Video.new.display_results(key.to_i)
        when "FLAC"
          results << Orders::Audio.new.display_results(key.to_i)
        end
      end

      results.join("\n")
    end
  end
end
