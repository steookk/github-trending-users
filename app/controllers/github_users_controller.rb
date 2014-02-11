class GithubUsersController < ApplicationController

	def index 	
		@new_github_users = GithubUser.pull_users
		@github_users = GithubUser.all
	end

end
