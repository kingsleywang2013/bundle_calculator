require_relative 'utility'
require_relative './orders/audio'
require_relative './orders/image'
require_relative './orders/video'

class Calculator
  class << self
    include Utility

    def run(input)
      order_commands = input.split(' ')

      # Validate user input order commands
      validate(order_commands)

      # Format user input orders
      orders = Hash[*order_commands]

      # Return calculated results
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
