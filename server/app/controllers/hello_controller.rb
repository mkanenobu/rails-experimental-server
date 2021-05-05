class HelloController < ApplicationController
  def index
    render json: { result: "Hello" }
  end
end
