Rails.application.routes.draw do
  get 'welcome/index'
  root 'welcome#index'

  resources :articles do
    resources :comments
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end


#Alternativa:
#https://scotch.io/tutorials/build-a-blog-with-ruby-on-rails-part-1
#config/routes.rb
#
# Rails.application.routes.draw do
#   root to: "articles#index"
#
#   resources :articles
# end
