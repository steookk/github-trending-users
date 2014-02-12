module GithubUsersHelper
	def gravatar_for(user, options = { :size => 100 })
	    gravatar_image_tag(user.email.downcase, :alt => user.name,
	                                            :class => 'img-circle img-responsive',
	                                            :gravatar => options) if user.email
	end
end
