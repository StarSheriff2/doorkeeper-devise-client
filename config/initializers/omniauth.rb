Rails.application.config.middleware.use OmniAuth::Builder do
  provider :oauth2, ENV['DOORKEEPER_APP_ID'], ENV['DOORKEEPER_APP_SECRET'],
           site: ENV.fetch("DOORKEEPER_APP_URL"),
           authorize_url: "/api/v1/oauth2/authorize",
           token_url: "/api/v1/oauth2/token"
end