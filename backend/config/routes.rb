Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :recipes do
        # get 'search', on: :index
        collection do
          post 'search'
        end
      end
      resources :tags
    end
  end
end
