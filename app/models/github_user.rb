class GithubUser < ActiveRecord::Base

	validates :name, :presence => true,
					 :uniqueness => { :case_sensitive => true }

	URI = 'https://github.com/trending/developers'

	def self.pull_users
		refs = scrape_trending_users
		if refs 
			refs.each_with_object([]) do |ref, new_users|
				ref.gsub!('/', '')
				new_users << create(ref) unless GithubUser.where(name: ref).first
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
		github_user.save!
		github_user
	end
end
