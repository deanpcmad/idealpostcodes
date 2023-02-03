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

  end
end
