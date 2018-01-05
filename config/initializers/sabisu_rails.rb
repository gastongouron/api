# Use this module to configure the sabisu available options

SabisuRails.setup do |config|

  config.base_api_uri = 'api.api.test'
  config.api_headers = { "Accept" => "application/vnd.api.v1" }
  config.resources = [:users, :trips]
  config.default_resource = :users

  # Application name
  # mattr_accessor :app_name
  # @@app_name = Rails.application.class.parent_name

  # Authentication
  # mattr_accessor :authentication_username
  # @@authentication_username = "admin"

  # mattr_accessor :authentication_password
  # @@authentication_password = "sekret"

end
