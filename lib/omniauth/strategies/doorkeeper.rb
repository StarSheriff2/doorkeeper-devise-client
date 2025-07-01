module OmniAuth
  module Strategies
    class Doorkeeper < OmniAuth::Strategies::OAuth2
      option :name, :doorkeeper

      option :client_options,
             site: ENV["DOORKEEPER_APP_URL"],
             authorize_path: "/oauth/authorize"

      uid do
        raw_info["user"]["resource_owner_id"]
      end

      info do
        {
          email: raw_info["user"]["email"],
          name: raw_info["user"]["email"], # fallback if name isn't returned
          user_type: raw_info["user"]["resource_owner_type"]
        }
      end

      def raw_info
        @raw_info ||= access_token.get("/api/v1/me.json").parsed
      end
    end
  end
end
