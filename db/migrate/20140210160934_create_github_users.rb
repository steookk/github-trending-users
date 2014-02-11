class CreateGithubUsers < ActiveRecord::Migration
  def change
    create_table :github_users do |t|
      t.string :name, :unique => true 

      t.timestamps
    end
  end
end
