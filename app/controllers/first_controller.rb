class FirstController < ApplicationController
  def hello
    # render plain: 'hello rails'
    # render json: {name: 'zch', age: 18}
    render 'first/hello'
  end
end