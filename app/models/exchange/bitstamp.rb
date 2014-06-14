module Exchange
  class Bitstamp
    def name
      :bitstamp
    end

    def current_price
      @price ||= begin
        json = RestClient.get 'https://www.bitstamp.net/api/ticker/'
        data = JSON::load(json)
        BigDecimal.new(data['last'])
      end
    end
  end
end