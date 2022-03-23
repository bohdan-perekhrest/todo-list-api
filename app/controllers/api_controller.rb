# frozen_string_literal: true

class ApiController < ActionController::API
  include SimpleEndpoint::Controller
  include DefaultEndpoint
end
