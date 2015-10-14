module Githubber
    class Issues
      include HTTParty
      base_uri "https://api.github.com"

        def initialize(auth_token)
          @auth = {
            "Authorization" => "token #{auth_token}",
            "User-Agent"    => "HTTParty"
        }
        end

	
		def comment_on_issue(owner, repo, number, comment)
			options = { body: comment }
			Issues.post("/repos/#{owner}/#{repo}/issues/#{number}/comments", :headers => @auth, :body => options.to_json)
		end

		def list_issues(owner, repo, number)
			Issues.get("/repos/#{owner}/#{repo}/issues/#{number}/comments", :headers => @auth)
		end

		def close_issue(owner, repo, number)
			Issues.patch("/repos/#{owner}/#{repo}/issues/#{number}", :headers => @auth, :body => { state: "closed"}.to_json)
		end

		def create_issue(owner, repo, name)
			options = { title:  name }
			Issues.post("/repos/#{owner}/#{repo}/issues", :headers => @auth, :body => options.to_json)
		end

		def list_teams(org)
			Issues.get("/orgs/#{org}/teams", :headers => @auth)
		end

		def team_members(id)
			Issues.get("/teams/#{id}/members", :headers => @auth)
		end

		def get_gist_content(id)
			
			response = Issues.get("/gists/#{id}", :headers => @auth)
		
			my_hash = response["files"].values[0]
			my_hash["content"]
		end
		

	end
end
#comment on an issue
#list issues for a repo
#close an issue

