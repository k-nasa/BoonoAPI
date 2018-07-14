# Load the Rails application.
require_relative 'application'

Amazon::Ecs.options = {
      AWS_access_key_id: ENV['AWA_ACCESS_KEY_ID'],
      AWS_secret_key:    ENV['AWA_SECRET_KEY'],
      associate_tag:     ENV['ACCOSIATE_TAG'],
      country: :jp
}
# Initialize the Rails application.
Rails.application.initialize!
