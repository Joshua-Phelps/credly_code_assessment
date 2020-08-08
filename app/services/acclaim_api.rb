require 'base64'
class AcclaimApi
  # ENDPOINT = `https://sandbox-api.youracclaim.com/v1/organizations/#{ENV['CREDLY_ORG_ID']}/`
  ENDPOINT = 'https://sandbox-api.youracclaim.com/v1/organizations/' + ENV["CREDLY_ORG_ID"]

  attr_reader :conn

  def initialize
    @conn = Faraday.new(url: ENDPOINT) do |faraday|
      faraday.response :json, content_type: /\bjson$/
      faraday.headers = headers 
      faraday.adapter Faraday.default_adapter
    end 
  end

  def get_badge_templates
    results = conn.get('badge_templates')
    results.body['data'].map{|t| [t['name'], t['id']]}
  end

  def get_issued_badges
    results = conn.get('badges')
  end 

  def post_badge(body)
    result = conn.post('badges', body.to_json)
    result.body['data'] && result.body['data']
  end 

  def headers 
    auth_token = Base64.strict_encode64(ENV["CREDLY_AUTH_TOKEN"])+'='
    headers = { 'Accept': 'application/json', 'Content-Type': 'application/json', 'Authorization': 'Basic ' + auth_token }
  end 

end