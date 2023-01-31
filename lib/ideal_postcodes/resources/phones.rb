module IdealPostcodes
  class PhonesResource < Resource

    def validate(number:)
      response = get_request("phone_numbers", params: {query: number})
      Phone.new(response.body["result"])
    end

  end
end
