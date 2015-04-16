class ThreetapsWrapper

  def self.search(params)
    response = RestClient.get "http://search.3taps.com",
      { params: params }
    parsed_response = JSON.parse response

    puts "Number of matches: #{parsed_response['num_matches']}"
    puts "Page: #{parsed_response['next_page']}"

    parsed_response["postings"].each do |post|
      if Rental.find_by threetaps_id: post["id"]
        break
      else
        Rental.create(threetaps_id: post["id"],
                      source: post["source"],
                      category: post["category"],
                      formatted_address: post["location"]["formatted_address"],
                      zip_code: post["location"]["zipcode"],
                      lat: post["location"]["lat"],
                      long: post["location"]["long"],
                      external_id: post["external_id"],
                      external_url: post["external_url"],
                      heading: post["heading"],
                      timestamp: post["timestamp"],
                      body: post["body"],
                      price: post["price"])
      end
    end

    # page = parsed_response["next_page"]
    # if page != -1
    #   anchor = parsed_response["anchor"]
    #   tier = parsed_response["next_tier"]
    #   new_params = params.merge({ page: page, tier: tier, anchor: anchor })
    #   self.search(new_params)
    # end
  end

  def self.apartments
    self.search( { "auth_token" => ENV["3TAPS_AUTH_TOKEN"],
                   "location.metro" => "USA-POR",
                   "category" => "RHFR",
                   "rpp" => "100",
                   "retvals" => "price,id,source,category,location,external_id,external_url,heading,timestamp,body",
                   })
  end

end
