class WelcomeController < ApplicationController
  def index
  render json: { status: 200, message: "smarty_pants_backend" }
  end
end
