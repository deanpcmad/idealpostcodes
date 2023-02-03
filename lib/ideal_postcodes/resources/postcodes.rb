module IdealPostcodes
  class PostcodesResource < Resource

    def lookup(postcode:)
      query = postcode.gsub(" ", "")
      response = get_request("postcodes/#{query}")
      Collection.from_response(response, type: Address)
    end

  end
end
