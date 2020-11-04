require_relative 'calculator'

module Orders
  class Audio
    BUNDLE_PACKAGES = {
      3 => 427.50,
      6 => 810,
      9 => 1147.50
    }
    FORMAT = "FLAC"

    attr_reader :bundle_packages, :format

    include Orders::Calculator

    def initialize
      @bundle_packages = BUNDLE_PACKAGES
      @format = FORMAT
    end
  end
end
