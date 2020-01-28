require 'open-uri'

class GeocodingController < ApplicationController
  def street_to_coords
    @street_address = params.fetch("user_street_address")
    sanitized_street_address = URI.encode(@street_address)

    # ==========================================================================
    # Your code goes below.
    # The street address the user input is in the string @street_address.
    # A sanitized version of the street address, with spaces and other illegal
    #   characters removed, is in the string sanitized_street_address.
    # ==========================================================================

    require("http")

    api_key = ENV.fetch("GMAPS_KEY")

    url = "https://maps.googleapis.com/maps/api/geocode/json?address=" + url_safe_street_address + "&key=" + api_key

    data = HTTP.get(url)
    location = data.fetch("results").at(0).fetch("geometry").fetch("location")
    @latitude = location.fetch("lat")

    @longitude = location.fetch("lng")

    render("geocoding_templates/street_to_coords.html.erb")
  end

  def street_to_coords_form
    render("geocoding_templates/street_to_coords_form.html.erb")
  end
end
