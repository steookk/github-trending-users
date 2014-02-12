class GithubUser < ActiveRecord::Base

	#no attr_accessible because fields value don't come from the controller 
	validates :name, :presence => true,
					 :uniqueness => { :case_sensitive => true }

	has_many :repositories

	URI = 'https://github.com/trending/developers'

	def self.fetch_users
		refs = scrape_trending_users
		if refs 
			refs.each_with_object([]) do |ref, new_users|
				ref.gsub!('/', '')
				new_users << create(ref) unless GithubUser.where(name: ref).first
			end
		end
	end

	def fetch_repos
		user = Octokit.user self.name
		repos = user.rels[:repos].get.data
		if repos 
			repos.each do |repo|
				unless self.repositories.where(name: repo.name).first 
					repository = self.repositories.build 
					repository.name = repo.name
					repository.language = repo.language 
					repository.html_url = repo.rels[:html].href
					repository.save!
				end
			end
		end
	end


	private 
	def self.scrape_trending_users 
		parse(RestClient.get(URI).body)
		rescue RestClient::Exception, SocketError 
		false
	end

	def self.parse(html)
		doc = Nokogiri::HTML.parse(html)
		refs = doc.css('.user-leaderboard-list-name').each_with_object([]) do |node, ary|
			ary << node.children.first.attributes['href'].value
		end
	end
 
	def self.create(name)
		github_user = GithubUser.new
		github_user.name = name 
		fetch_user_data(github_user)
		github_user.save!
		github_user
	end

	def self.fetch_user_data(user) 
		client = Octokit::Client.new
		data = client.user user.name
		user.fullname = data.name
		user.type_of_user = data.type 
		user.hireable = data.hireable
		user.public_repos = data.public_repos
		user.email = data.email
	end
end
