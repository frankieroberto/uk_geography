UkGeog::Application.routes.draw do


  resources :area_types

  resources :areas, :path => '', :only => [:show], :constraints => {:id => /[^\/]+/} do
    resource :post_code_areas
  end

  root :to => "homepage#show"

end
