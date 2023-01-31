module IdealPostcodes
  class AddressesResource < Resource

    def find(**params)
      response = get_request("autocomplete/addresses", params: params)
      Address.new(response.body)
    end

  end
end
