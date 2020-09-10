class FirstController < ApplicationController
  def hello
    # render plain: 'hello rails'
    # render json: {name: 'zch', age: 18}
    @xxx = 'Controller 里面的 xxx 变量'
    render 'first/hello'
  end
  def hi
    render template: 'first/hi', layout: 'application'
  end
end