# frozen_string_literal: true

module Api::V1::Lib::Service
  class Authorize
    def self.call(ctx, request:, **)
      token = request.get_header('HTTP_ACCESS_TOKEN')
      decoded_token = Api::V1::Lib::Service::AuthorizeToken.decode(token)
      user_id = decoded_token.first['user_id']
      ctx[:current_user] = User.find(user_id)
    end
  end
end
