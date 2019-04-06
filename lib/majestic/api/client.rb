module Majestic
  module Api

    class Client
      attr_accessor :configuration, :connection, :api_url
      include Majestic::Api::Logger

    	def initialize(configuration: ::Majestic::Api.configuration)
        self.configuration    =   configuration
    		
        set_api_url
    		set_connection
    	end
      
    	def set_api_url(format = :json)
        self.api_url          =   case self.configuration.environment.to_sym
          when :sandbox     then "https://developer.majestic.com/api/#{format}"
          when :production  then "https://api.majestic.com/api/#{format}"
          else
            "https://developer.majestic.com/api/#{format}"
        end
      end

    	def set_connection(headers: {})        
        headers         =   {
          "User-Agent"    =>  self.configuration.user_agent,
          "Content-Type"  =>  "application/json"
        }.merge(headers)
        
    	  self.connection = Faraday.new(url: self.api_url, ssl: {verify: false}) do |builder|
          builder.headers     =   headers
          
          builder.request  :url_encoded
          builder.request  :retry
          builder.response :json
          builder.response :logger if self.configuration.verbose
          builder.adapter  :net_http
        end
    	end

    	def get_index_item_info(urls:, params: {}, options: {})
    	  request_parameters                    =   {}
    	  request_parameters[:datasource]       =   params.fetch(:data_source, "historic")
        request_parameters[:items]            =   urls.size

        urls.each_with_index do |url, index|
          request_parameters["item#{index}"]  =   url
        end

        response    =   self.execute_command("GetIndexItemInfo", params: request_parameters, options: options)
        response    =   Majestic::Api::ItemInfoResponse.new(response)

        return response
    	end

    	# This method will execute the specified command as an api request.
    	# 'name' is the name of the command you wish to execute, e.g. GetIndexItemInfo
    	# 'parameters' a hash containing the command parameters.
    	# 'timeout' specifies the amount of time to wait before aborting the transaction. This defaults to 5 seconds.
    	def execute_command(name, params: {}, options: {})
    		params.merge!({
          app_api_key: self.configuration.api_key,
          cmd:         name
        })
        
    		self.execute_request(params: params, options: options)
    	end

    	# This will execute the specified command as an OpenApp request.
    	# 'command_name' is the name of the command you wish to execute, e.g. GetIndexItemInfo
    	# 'parameters' a hash containing the command parameters.
    	# 'access_token' the token provided by the user to access their resources.
    	# 'timeout' specifies the amount of time to wait before aborting the transaction. This defaults to 5 seconds.
    	def execute_open_app_request(command_name, access_token, params: {}, options: {})
    		params.merge!({
          accesstoken: access_token,
          cmd:         command_name,
          privatekey:  self.configuration.api_key
        })
        
    		self.execute_request(params: params, options: options)
    	end

    	# 'parameters' a hash containing the command parameters.
    	# 'options'  a hash containing command/call options (timeout, proxy settings etc)
    	def execute_request(params: {}, options: {})
        response        =   nil
        
        log(:info, "[Majestic::Api::Client] - Sending API Request to Majestic SEO. Parameters: #{params.inspect}. Options: #{options.inspect}")
        
        response        =   self.connection.get do |request|
          request.params                    =   params  if params && !params.empty?
          request.options                   =   options if options && !options.empty?
        end
        
    		return response
    	end
      
      def verbose
        self.configuration.verbose
      end

    end

  end
end
