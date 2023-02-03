module IdealPostcodes
  class AddressesResource < Resource

    def find(**params)
      response = get_request("autocomplete/addresses", params: params)
      Collection.from_response(response, type: Address)
    end

    def resolve(kind:, address:)
      response = get_request("autocomplete/addresses/#{address}/#{kind}")
      Address.new(response.body["result"])
    end

    def lookup(postcode:)
      query = postcode.gsub(" ", "")
      response = get_request("postcodes/#{query}")
      Collection.from_response(response, type: Address)
    end

    def udprn(query:)
      response = get_request("udprn/#{query}")
      Address.new(response.body["result"])
    end

    def umprn(query:)
      response = get_request("umprn/#{query}")
      Address.new(response.body["result"])
    end

  end
end
