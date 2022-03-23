require 'reform'
require 'reform/form/dry'
require "trailblazer/developer"
Dev = Trailblazer::Developer

Rails.application.configure do
  config.trailblazer.use_loader = false
end
