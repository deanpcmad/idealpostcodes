module IdealPostcodes
  class PlacesResource < Resource

    def find(**params)
      response = get_request("places", params: params)
      Collection.from_response(response, type: Place)
    end

    def resolve(place:)
      response = get_request("places/#{place}")
      Place.new(response.body["result"])
    end

  end
end
