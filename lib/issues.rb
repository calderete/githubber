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
			Issues.post("/repos/#{owner}/#{repo},issues/#{number}/comments", :header => @auth, :body => comment.to_s)
		end

	end
end
#comment on an issue
#list issues for a repo
#close an issue

