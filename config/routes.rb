Rails.application.routes.draw do
  get "outside_tracker/index"
  post "outside_tracker/create"
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
