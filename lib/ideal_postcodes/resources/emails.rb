module IdealPostcodes
  class EmailsResource < Resource

    def validate(email:)
      response = get_request("emails", params: {query: email})
      Email.new(response.body["result"])
    end

  end
end
