module IdealPostcodes
  class Client
    attr_reader :api_key, :adapter

    def initialize(api_key:, adapter: Faraday.default_adapter, stubs: nil)
      @api_key = api_key
      @adapter = adapter

      # Test stubs for requests
      @stubs = stubs
    end

    def addresses
      AddressesResource.new(self)
    end

    def emails
      EmailsResource.new(self)
    end

    def phones
      PhonesResource.new(self)
    end

    def connection
      url = "https://api.ideal-postcodes.co.uk/v1"

      @connection ||= Faraday.new(url) do |conn|
        conn.headers = {
          "User-Agent" => "idealpostcodes/v#{VERSION} (github.com/deanpcmad/idealpostcodes)",
          "Authorization" => "api_key=\"#{api_key}\""
        }
        
        conn.request :json
        conn.response :json

        conn.adapter adapter, @stubs
      end
    end

  end
end
