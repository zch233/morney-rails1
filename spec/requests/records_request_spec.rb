require 'rails_helper'

RSpec.describe "Records", type: :request do
  it '可以创建一条记录' do
    post '/records', params: {amount: 1000, category: 'outgoings', notes: '聚会'}
    expect(response.status).to eq 200
    body = JSON.parse(response.body)
    expect(body['resource']['id']).to be_a Numeric
  end
end
