class DynVpnApi::ActivationResponse
	def initialize(response)
		@faraday_response = response
	end

	def ok?
		@faraday_response.status == 200
	end
end

