require 'rails_helper'

RSpec.describe "Users", type: :request do
  it 'should create user' do
    post '/users', params: {email: ''}
    expect(response.status).to eq 422
    body = JSON.parse(response.body)
    expect(body['errors']['email'][0]).to eq '邮箱不能为空'
    expect(body['errors']['email'].length).to eq 1
    expect(body['errors']['password'][0]).to eq '密码不能为空'
    expect(body['errors']['password'].length).to eq 1
    expect(body['errors']['password_confirmation'][0]).to eq '确认密码不能为空'
    expect(body['errors']['password_confirmation'].length).to eq 1
  end
  it '未登录无法得到个人信息' do
    get '/current_user_info'
    expect(response).to have_http_status 401
  end
  it '登录以后可以得到个人信息' do
    user = post '/users', params: { email: '1@qq.com', password: '123456', password_confirmation: '123456' }
    session = post '/sessions', params: { email: '1@qq.com', password: '123456' }
    p user
    p session
    get '/current_user_info'
    expect(user.id).to eq session.id
  end
end
