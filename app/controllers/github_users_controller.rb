class GithubUsersController < ApplicationController

	def index 	
		@new_github_users = GithubUser.fetch_users
		@github_users = GithubUser.order('created_at DESC')
	end

	def show 
		@github_user = GithubUser.find(params[:id])
		@github_user.fetch_repos 
	end

end
