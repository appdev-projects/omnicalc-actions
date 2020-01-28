require 'open-uri'

class ForecastController < ApplicationController
  def coords_to_weather
    @lat = params.fetch("user_latitude").strip
    @lng = params.fetch("user_longitude").strip

    # ==========================================================================
    # Your code goes below.
    # The latitude the user input is in the string @lat.
    # The longitude the user input is in the string @lng.
    # ==========================================================================

    require("http")

    key = ENV.fetch("DARK_SKY_KEY")

    api_url = "https://api.darksky.net/forecast/"+ key + "/" + @lat + "," +  @lng
    
    results = HTTP.get(api_url)
    
    @current_temperature = results.fetch("currently").fetch("temperature")

    @current_summary = results.fetch("currently").fetch("summary")

    @summary_of_next_sixty_minutes = results.fetch("minutely").fetch("summary")

    @summary_of_next_several_hours = results.fetch("hourly").fetch("summary")

    @summary_of_next_several_days = results.fetch("daily").fetch("summary")

    render("forecast_templates/coords_to_weather.html.erb")
  end

  def coords_to_weather_form
    render("forecast_templates/coords_to_weather_form.html.erb")
  end
  
end
