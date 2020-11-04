module Errors
  class CommandFormatError < StandardError; end

  class OrderFormatError < StandardError; end

  class OrderAmountError < StandardError; end

  class OrderBundleError < StandardError; end
end
