module IdealPostcodes
  class Collection
    attr_reader :data, :total

    def self.from_response(response, type:)
      body = response.body

      if body["result"] and body["result"].include? "hits"
        data = body["result"]["hits"]
      else
        data = body["result"]
      end

      new(
        data: data.map { |attrs| type.new(attrs) },
        total: data.count
      )
    end

    def initialize(data:, total:)
      @data = data
      @total = total
    end
  end
end
