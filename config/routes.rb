Rails.application.routes.draw do
  get("/", { :controller => "word_count", :action => "word_count_form" })

  get("/word-count/new",                  { :controller => "word_count", :action => "word_count_form" })
  get("/word-count/results",              { :controller => "word_count", :action => "word_count" })

  get("/word-count/new",                  { :controller => "word_count", :action => "word_count_form" })
  get("/word-count/results",              { :controller => "word_count", :action => "word_count" })

  get("/loan-payment/new",                { :controller => "loan_payment", :action => "loan_payment_form" })
  get("/loan-payment/results",            { :controller => "loan_payment", :action => "loan_payment" })

  get("/time-between/new",                { :controller => "time_between", :action => "time_between_form" })
  get("/time-between/results",            { :controller => "time_between", :action => "time_between" })

  get("/stats/new",                       { :controller => "stats", :action => "stats_form" })
  get("/stats/results",                   { :controller => "stats", :action => "stats" })

  get("/street-to-coords/new", { :controller => "geocoding", :action => "street_to_coords_form" })
  get("/street-to-coords/results", { :controller => "geocoding", :action => "street_to_coords" })

  get("/coords-to-weather/new", { :controller => "forecast", :action => "coords_to_weather_form" })
  get("/coords-to-weather/results", { :controller => "forecast", :action => "coords_to_weather" })

  get("/street-to-weather/new", { :controller => "meteorologist", :action => "street_to_weather_form" })
  get("/street-to-weather/results", { :controller => "meteorologist", :action => "street_to_weather" })
  
  # ================================================================================
  # Write your routes above.
  # ================================================================================
end
