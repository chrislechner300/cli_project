class Api


    def self.get_data
        response = RestClient.get("https://api.openbrewerydb.org/breweries?by_city=denver&page=4")
        data = JSON.parse(response.body)
           
        
        data.each do |brewery_finder_data|
             BreweryFinder.new(brewery_finder_data["name"], brewery_finder_data["street"], brewery_finder_data["city"], brewery_finder_data["state"], brewery_finder_data["website_url"])
        end
    end
end      