class AddFieldsToGithubUsers < ActiveRecord::Migration
  def change
  		add_column :github_users, :fullname, :string
		add_column :github_users, :type_of_user, :string
		add_column :github_users, :hireable, :boolean, :default => false
		add_column :github_users, :public_repos, :integer, :default => 0
  end
end
