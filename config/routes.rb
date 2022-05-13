Rails.application.routes.draw do
  resources :items, only: %i[index] do
    collection do
      put :update_price
      get :check_list_price
    end
  end
end
