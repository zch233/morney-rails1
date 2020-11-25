require 'rails_helper'
require 'rspec_api_documentation/dsl'

resource "Users" do
  post "/users" do
    parameter :email, '邮箱', type: :string, require: true
    parameter :password, '密码', type: :string, require: true
    parameter :password_confirmation, '确认密码', type: :string, require: true
    example "创建用户" do
      do_request(email: '1@qq.com', password: '123456', password_confirmation: '123456')
      expect(status).to eq 200
    end
  end
  get "/users" do
    example "获取用户列表" do
      do_request
      expect(status).to eq 200
    end
  end
end