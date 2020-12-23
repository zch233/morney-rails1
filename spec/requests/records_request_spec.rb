require 'rails_helper'

RSpec.describe "Records", type: :request do
  it '未登录无法创建' do
    post '/records', params: {amount: 1000, category: 'outgoings', notes: '聚会'}
    expect(response.status).to eq 401
  end
  it '可以创建一条记录' do
    post '/users', params: { email: '1@qq.com', password: '123456', password_confirmation: '123456' }
    post '/sessions', params: { email: '1@qq.com', password: '123456' }
    post '/records', params: {amount: 1000, category: 'outgoings', notes: '聚会'}
    expect(response.status).to eq 200
    body = JSON.parse(response.body)
    expect(body['resource']['id']).to be_a Numeric
  end
  it '可以创建一条记录-参数为空' do
    post '/users', params: { email: '1@qq.com', password: '123456', password_confirmation: '123456' }
    post '/sessions', params: { email: '1@qq.com', password: '123456' }
    post '/records', params: {}
    expect(response.status).to eq 422
    body = JSON.parse response.body
    expect(body['errors']['amount'][0]).to eq '金额不能为空'
    expect(body['errors']['category'][0]).to eq '类型不能为空'
  end
end
