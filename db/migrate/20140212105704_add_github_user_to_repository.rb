class AddGithubUserToRepository < ActiveRecord::Migration
  def change
    add_column :repositories, :github_user_id, :integer
  end
end
