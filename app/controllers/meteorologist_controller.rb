require 'open-uri'

class MeteorologistController < ApplicationController
  def street_to_weather
    @street_address = params.fetch("user_street_address").strip
    sanitized_street_address = URI.encode(@street_address)

    # ==========================================================================
    # Your code goes below.
    # The street address the user input is in the string @street_address.
    # A sanitized version of the street address, with spaces and other illegal
    #   characters removed, is in the string sanitized_street_address.
    # ==========================================================================
    require("http")

    gmaps_key = ENV.fetch("GMAPS_KEY")

    url = "https://maps.googleapis.com/maps/api/geocode/json?address=" + sanitized_street_address + "&key=" + gmaps_key

    data = HTTP.get(url)
    parsed_data = JSON.parse(data)
    location = parsed_data.fetch("results").at(0).fetch("geometry").fetch("location")
    latitude = location.fetch("lat").to_s

    longitude = location.fetch("lng").to_s

    darksky_key = ENV.fetch("DARK_SKY_KEY")

    api_url = "https://api.darksky.net/forecast/"+ darksky_key + "/" + latitude + "," +  longitude
    
    response = HTTP.get(api_url)
    
    results = JSON.parse(response)

    @current_temperature = results.fetch("currently").fetch("temperature")

    @current_summary = results.fetch("currently").fetch("summary")

    @summary_of_next_sixty_minutes = results.fetch("minutely").fetch("summary")

    @summary_of_next_several_hours = results.fetch("hourly").fetch("summary")

    @summary_of_next_several_days = results.fetch("daily").fetch("summary")

    render("meteorologist_templates/street_to_weather.html.erb")
  end

  def street_to_weather_form
    render("meteorologist_templates/street_to_weather_form.html.erb")
  end
end
