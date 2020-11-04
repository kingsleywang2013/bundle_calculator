require_relative 'calculator'

module Orders
  class Image
    BUNDLE_PACKAGES = {
      5 => 450,
      10 => 800
    }
    FORMAT = "IMG"

    attr_reader :bundle_packages, :format

    include Orders::Calculator

    def initialize
      @bundle_packages = BUNDLE_PACKAGES
      @format = FORMAT
    end
  end
end
