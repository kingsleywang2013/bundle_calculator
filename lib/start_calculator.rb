require_relative 'calculator'

class StartCalculator
  class << self
    def run
      start_message

      run_calculator
    end

    private

    def start_message
      puts instruction
      print prompt
    end

    def prompt
      '>'
    end

    def instruction
      instruction = [
        "Please input your order as following format",
        'Example:',
        '10 IMG',
        '10 IMG 15 FLAC',
        '10 IMG 15 FLAC 13 VID',
        '=========================',
        "'QUIT' or 'EXIT' to exit."
      ]
      instruction.join("\n")
    end

    def empty_input_message
      'Empty command, please input again'
    end

    def run_calculator
      while input = gets.chomp
        input = input.upcase
        # Exit the loop when input is 'quit' or 'exit'
        break if input == 'QUIT' || input == 'EXIT'

        # Prompt some instruction if input is empty
        if input == ''
          puts empty_input_message
          puts "\n"
          print start_message
          next
        end

        # Execute input command and check if the input is valid.
        # If the input is valid, the calculator will return
        # the output otherwise it will print out the error instruction
        begin
          output = Calculator.run(input)
        rescue StandardError => e
          puts e
          puts "\n"
          print start_message
          next
        end

        puts output if output
        puts "\n"
        print start_message
      end
    end
  end
end
