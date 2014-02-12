class Repository < ActiveRecord::Base

	#no attr_accessible because fields value don't come from the controller 
	belongs_to :github_user

end
