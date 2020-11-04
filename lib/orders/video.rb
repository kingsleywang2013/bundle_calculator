require_relative 'calculator'

module Orders
  class Video
    BUNDLE_PACKAGES = {
      3 => 570,
      5 => 900,
      9 => 1530
    }
    FORMAT = "VID"

    attr_reader :bundle_packages, :format

    include Orders::Calculator

    def initialize
      @bundle_packages = BUNDLE_PACKAGES
      @format = FORMAT
    end
  end
end
