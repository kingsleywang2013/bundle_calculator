module Orders
  module Calculator
    def display_results(amount)
      results = calculate_result_counts(amount)

      output = []
      total = 0

      results.each do |key, value|
        total += value * bundle_packages[key]
        output << "\t#{value} x #{key} $#{value * bundle_packages[key]}"
      end

      title = "#{amount} #{format} $#{total}"
      output.unshift(title).join("\n")
    end

    private

    def calculate_result_counts(amount)
      bundle_result = calculate_bundles(amount)

      counts = Hash.new(0)
      bundle_result.each { |result| counts[result] += 1 }

      counts
    end

    def calculate_bundles(amount)
      if amount == 0
        raise(
          StandardError,
          "Amount should be greater than 0"
        )
      end

      bundles = bundle_packages.keys

      bundles.sort! { |a, b| a <=> b }

      optimal_calculate = Hash.new do |hash, key|
        if key < bundles.min
          hash[key] = []
        elsif bundles.include?(key)
          hash[key] = [key]
        else
          hash[key] = bundles
            .reject { |bundle| bundle > key }
            .map { |bundle| [bundle] + hash[key - bundle] }
            .reject { |calculate| calculate.inject(&:+) != key }
            .min { |a, b| a.size <=> b.size } || []
        end
      end

      if optimal_calculate[amount].empty?
        raise(
          StandardError,
          "Sorry, we have no matched bundles for #{format} with your order amount #{amount}"
        )
      else
        optimal_calculate[amount].sort
      end
    end
  end
end

