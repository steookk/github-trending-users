require 'spec_helper'
require 'webmock/rspec'

describe GithubUsersController do
		render_views

		#-------------VISUALIZATION-------------
		describe "visualization" do 
			describe 'GET #index' do 
				context "success" do 
					before :each do 
						WebMock::API.stub_request(:get, GithubUser::URI).
						    to_return(:status => 200, :body => fixture("trending_developers.html"))
						create_users_from_fixture 
						get :index 
					end

					it 'fetches new trending users from Github' do 
						expect(WebMock::API.a_request(:get, GithubUser::URI)).to have_been_made
					end

					it "lists newly added github users" do 
						expect(assigns(:new_github_users).count).to be 21 
					end

					it 'lists all GithubUsers' do
						expect(assigns(:github_users).count).to be GithubUser.all.count 
					end

					it 'is successful' do 
						expect(response).to be_success
					end
				end

				context "success even if Github responds with error" do 
					before do 
						WebMock::API.stub_request(:get, GithubUser::URI).
							to_return(:status => [500, "Internal Server Error"])
						create_users_from_fixture
						get :index 
					end

					it "anyways displays existing github users" do 
						expect(assigns(:github_users).count).to be 4
					end 

					it 'is successful' do 
						expect(response).to be_success
					end
				end
			end
		end

end
