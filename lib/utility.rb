module Utility
  # Define a constant for all valid commands for simulator
  FORMATS = ['VID', 'IMG', 'FLAC'].freeze

  def validate(order_commands)
    if order_commands.length % 2 != 0
      raise(
        StandardError,
        "Command Format Error - An example input: 10 IMG 15 FLAC 13 VID"
      )
    end

    order_commands.each_with_index do |order_command, index|
      if (index + 1) % 2 == 0
        validate_order_format(order_command)
      else
        validate_order_amount(order_command)
      end
    end
  end

  private

  def is_integer?(n)
    !!(n.match /^(\d)+$/)
  end

  def validate_order_format(order_command)
    unless FORMATS.include?(order_command)
      raise(
        StandardError,
        "#{order_command} is not a valid order format, please choose one in #{FORMATS}"
      )
    end
  end

  def validate_order_amount(order_command)
    unless is_integer?(order_command)
      raise(
        StandardError,
        "#{order_command} is not a valid integer"
      )
    end
  end
end
