GithubTrendingUsers::Application.routes.draw do

   root :to => "GithubUsers#index" 

   resources :github_users, :only => [:index, :show]

   resources :repositories, :only => :show

end
