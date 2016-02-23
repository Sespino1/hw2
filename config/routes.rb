Rails.application.routes.draw do
Myrottenpotatoes::Application.routes.draw do
  resources :movies
  root :to => redirect('/movies')
end
 
end
