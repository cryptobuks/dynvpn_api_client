class DynVpnApi::Client
	def self.register_email(email)
			response = connection.post '/v1/account/register', { email: email }
			DynVpnRegistrationResponse.new(response)
	end

	def self.activate_token(token)
			response = connection.post '/v1/account/activate', { email: email }
			DynVpnActivationResponse.new(response)
	end

	def self.connection
		@connection ||= Faraday.new(:url => Rails.configuration.dynvpn.api_site)
	end
end

