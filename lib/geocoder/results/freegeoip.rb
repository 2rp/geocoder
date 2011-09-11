require 'geocoder/results/base'

module Geocoder::Result
  class Freegeoip < Base

    def address(format = :full)
      "#{city}#{', ' + state_code unless state_code == ''} #{postal_code}, #{country}".sub(/^[ ,]*/, "")
    end

    def city
      @data['city']
    end

    def state
      @data['regionname']
    end

    def state_code
      @data['regioncode']
    end

    def country
      @data['countryname']
    end

    def country_code
      @data['countrycode']
    end

    def postal_code
      @data['zipcode']
    end

    def self.response_attributes
      %w[metrocode ip]
    end

    response_attributes.each do |a|
      define_method a do
        @data[a]
      end
    end
  end
end
