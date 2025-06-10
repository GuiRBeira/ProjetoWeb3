# Load the Rails application.
require_relative "application"
require "active_support/core_ext/integer/time"

# Initialize the Rails application.
Rails.application.initialize!

Rails.application.configure do
  # Enable Solid Cache for caching in the test environment.
  config.solid_cache.enabled = true

  # Configure Solid Queue to run in the test environment.
  config.solid_queue.enabled = true

  # Configure Solid Cable to run in the test environment.
  config.solid_cable.enabled = true
  config.host = "projetoweb3-cvqd.onrender.com"

  # Set the default host for URL generation in mailers.
  config.action_mailer.default_url_options = { host: "test.example.com" }
end
