require_relative 'boot'

require 'rails/all'
require 'aws-sdk'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

Dotenv::Railtie.load

module FilesFolders
  class Application < Rails::Application
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.

    Aws.config.update({
      credentials: Aws::Credentials.new(ENV['S3_ACCESSS_KEY_ID'], ENV['S3_SECRET_ACCESS_KEY']),
      region: ENV['S3_REGION'],
      endpoint: "https://s3-#{ENV['S3_REGION']}.amazonaws.com"
    })
  end
end
