class HogeController < ApplicationController
  def fuga
    render json: {hello: 'world'}
  end
end
