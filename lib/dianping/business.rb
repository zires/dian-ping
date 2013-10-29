# encoding: utf-8
module DP
  module Business

    # coordinate[31.2204200000392, 121.41163000018]
    def coordinate(location)
      add :latitude,  location.first
      add :longitude, location.last
    end

    def latitude(lat)
      add :latitude, lat
    end

    def longitude(long)
      add :longitude, long
    end

  end
end
