require 'faraday'

class DynVpnApi::Client
	# You may specify a password and/or a url_pattern in the optionals hash
	def self.register_email(email, optionals={})
			response = connection.post '/v1/account/register', { email: email, password: optionals[:password], url_pattern: optionals[:url_pattern] }
			DynVpnApi::RegistrationResponse.new(response)
	end

	def self.activate_token(token)
			response = connection.post '/v1/account/activate', { token: token }
			DynVpnApi::ActivationResponse.new(response)
	end

	def self.connection
		@connection ||= Faraday.new(:url => Rails.configuration.x.dynvpn.api_site)
	end
end

