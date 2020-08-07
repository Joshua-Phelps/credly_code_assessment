require 'base64'
class AcclaimApi
  # ENDPOINT = `https://sandbox-api.youracclaim.com/v1/organizations/#{ENV['CREDLY_ORG_ID']}/`
  ENDPOINT = 'https://sandbox-api.youracclaim.com/v1/organizations/' + ENV["CREDLY_ORG_ID"]

  attr_reader :conn

  def initialize
    @conn = Faraday.new(url: ENDPOINT) do |faraday|
      faraday.response :json, content_type: /\bjson$/ 
      faraday.adapter Faraday.default_adapter
    end 
  end

  def get_badge_templates
    conn.headers = headers
    results = conn.get('badge_templates')
    results.body['data'].map{|t| {name: t['name'], id: t['id']}}
  end

  def post_badge(query_params)
    conn.post('badges')
  end 

  def headers 
    auth_token = Base64.strict_encode64(ENV["CREDLY_AUTH_TOKEN"])+'='
    headers = { 'Accept': 'application/json', 'Content-Type': 'applicaiton/json', 'Authorization': 'Basic ' + auth_token }
  end 

end