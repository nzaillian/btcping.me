module Exchange
  class Coinbase
    def name
      :coinbase
    end

    def current_price
      @price ||= begin
        json = RestClient.get 'https://coinbase.com/api/v1/prices/spot_rate'
        data = JSON::load(json)
        BigDecimal.new(data['amount'])
      end
    end    
  end
end