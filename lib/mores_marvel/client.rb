require 'rest_client'
require 'digest/md5'
require 'json'
require_relative 'resource'

module MoresMarvel
  class Client
    include MoresMarvel::Resource

    def initialize config
      @public_key = config[:public_key]
      @private_key = config[:private_key]
      @base_uri = config[:base_uri]
    end

    def get_resource(resource, filters = {})
      api_end_point = "#{@base_uri}#{resource}"
      url_params = filters.empty? ? security_hash : security_hash.merge(filters)
      begin
        restructure_response RestClient.get(api_end_point, { params: url_params })
      rescue RestClient::Conflict, RestClient::NotFound => errors
        errors
      end
    end

    private
    def security_hash
      timestamp = Time.now.to_i.to_s
      oauth_hash = Digest::MD5.hexdigest(timestamp+@private_key+@public_key)
      { ts: timestamp, apikey: @public_key, hash: oauth_hash }
    end

    def restructure_response raw_data
      response = JSON.parse(raw_data)
      { code: response['code'],  status: response['status'], data: response['data'] }
    end
  end
end
