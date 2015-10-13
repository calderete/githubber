module Githubber
	class PullRequests
		include HTTParty
		base_uri "https://api.github.com"
		
		def initialize(auth_token)
			@auth = {
				"Authorization" => "token #{auth_token}",
				"User-Agent"    => "HTTParty"
			}
		end

		def pull_request(owner, repo, number)
			PullRequests.get("/repos/#{owner}/#{repo}/pulls/#{number}", :headers => @auth)
		end

		def create_pull_request(owner, repo, options={})
			PullRequests.post("/repos/#{owner}/#{repo}/pulls", :headers => @auth, 
											:body => options.to_json)			
		end
	
		def create_pull_request_merge?(owner, repo, numbers)
			PullRequests.get("/repos/#{owner}/#{repo}/pulls/#{number}/merge")
		end
	end
end 

