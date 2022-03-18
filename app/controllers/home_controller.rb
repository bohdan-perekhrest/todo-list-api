# frozen_string_literal: true

class HomeController < ApplicationController
  def index
    render "public/docs/v1"
  end
end
