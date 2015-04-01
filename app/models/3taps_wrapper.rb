class 3taps_Wrapper

  def self.search(metro_code:, category:, retvals:, rpp:)
    response = RestClient.get 'http://search.3taps.com',
      { params: { 'auth_token' => ENV['3TAPS_AUTH_TOKEN'],
                  'location.metro' => metro_code,
                  'category' => category,
                  'retvals' => retvals,
                  'rpp' => rpp }}
  end
end
