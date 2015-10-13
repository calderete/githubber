module GitHubber
	class Issues
		include HTTParty
		base_uri "https://api.github.com"

		def initialize(auth_token)
			@auth = {
				"Authorization" => "token #{auth_token}"
				"User-Agent"    => "HTTParty"
			}
	end
end