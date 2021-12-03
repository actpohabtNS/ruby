Rails.application.routes.draw do
  root "students#index"

  get "/students/onlyWomen", to:"students#onlyWomen" , :as => :onlyWomen
  get "/students/onlyFourthYear", to:"students#onlyFourthYear" , :as => :onlyFourthYear
  get "/students/older20", to:"students#older20" , :as => :older20

  resources :students

end
