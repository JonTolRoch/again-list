Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "lists#index"
  get "/lists", to: "lists#index", as: "lists"
  get "/lists/new",to: "lists#new", as: "new_list"
  get "/lists/:id", to: "lists#show", as: "list"
  post "lists",to:"lists#create"
  delete "lists/:id",to:"lists#destroy",as: "delete_list"
  get "/lists/:list_id/bookmarks/new",to:"bookmarks#new",as:"new_bookmark"
  post "/lists/:list_id/bookmarks",to:"bookmarks#create",as:"create_bookmark"
  delete "bookmarks/:id",to:"bookmarks#destroy",as:"delete_bookmark"

end
