Rails.application.routes.draw do
  get "/tracker", to: "outside_tracker#index"
  post "/tracker", to: "outside_tracker#create"
  patch "/tracker/:id", to: "outside_tracker#update"
  get "/current_user", to: "current_user#index"
  get "activities/index"
  get "activities/show"
  devise_for :users, path: "", path_names: {
    sign_in: "login",
    sign_out: "logout",
    registration: "signup"
  },
  controllers: {
    sessions: "users/sessions",
    registrations: "users/registrations"
  }
end
