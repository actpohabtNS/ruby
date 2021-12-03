Rails.application.routes.draw do
  root "students#index"

  get "/students/dormitory", to:"students#dormitory" , :as => :dormitory
  get "/students/teachers", to:"students#teachers_with_stand" , :as => :teachers
  get "/students/from_pedagogical", to:"students#pedagogical_school" , :as => :pedagogical_school
  get "/students/language_groups", to:"students#language_groups" , :as => :language_groups
  get "/students/language_group", to:"students#language_group", :as => :language_group

  resources :students

end
