class BreweryFinder

    attr_accessor :name, :street, :city, :state, :website_url

    @@all = []

    def initialize(name, street, city, state, website_url)
        self.name = name
        self.street = street
        self.city = city
        self.state = state
        self.website_url = website_url
        @@all << self
    end

    def self.all
        @@all
    end

end
