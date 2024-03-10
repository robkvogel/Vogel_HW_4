Rails.application.routes.draw do
  get("/", { :controller => "places", :action => "index" })
  resources "entries"
  resources "places"
  resources "sessions"
  resources "users"

  get "/logout", :controller => "sessions", :action => "destroy"
  get "/login", :controller => "sessions", :action => "new"
  
end
