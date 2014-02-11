require 'spec_helper'
require 'webmock/rspec'

describe GithubUser do
	# --------------CREATION-----------------
	describe '::pull_users' do 
		before :each do 
			WebMock::API.stub_request(:get, GithubUser::URI).
			      to_return(:status => 200, :body => fixture("trending_developers.html"))
			create_users_from_fixture
		end

		subject { GithubUser.pull_users }

		it 'gets users names from github.com/trending' do 
			subject 
			expect(WebMock::API.a_request(:get, GithubUser::URI)).to have_been_made
		end

		it 'creates users not present yet in our db' do 
			#fixture contains 25 names. 4 are already stored in the db 
			expect(lambda { subject }).to change(GithubUser, :count).by 21
		end

		it 'returns an array with newly created users' do 
			expect(subject).to be_a Array 
			expect(subject.length).to be 21 
			expect(subject[0]).to be_a GithubUser
		end
	end
end
