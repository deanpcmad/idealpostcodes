module IdealPostcodes
  class Collection
    attr_reader :data, :total

    def self.from_response(response, type:)
      body = response.body

      new(
        data: body["result"]["hits"].map { |attrs| type.new(attrs) },
        total: body["result"]["hits"].count
      )
    end

    def initialize(data:, total:)
      @data = data
      @total = total
    end
  end
end
