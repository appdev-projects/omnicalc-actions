Rails.application.routes.draw do
  get("/", { :controller => "word_count", :action => "word_count_form" })

  get("/word-count/new",                  { :controller => "word_count", :action => "word_count_form" })
  get("/word-count/results",              { :controller => "word_count", :action => "word_count" })
  
  # ================================================================================
  # Write your routes above.
  # ================================================================================
end
