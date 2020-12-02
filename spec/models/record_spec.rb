require 'rails_helper'

RSpec.describe Record, type: :model do
  it '创建时必须要填金额' do
    record = Record.create category: 'outgoings', notes: '测试的备注'
    expect(record.errors.details[:amount][0][:error]).to eq(:blank)
  end
  it '创建时必须要填类型' do
    record = Record.create amount: 10000, notes: '测试的备注'
    expect(record.errors.details[:category][0][:error]).to eq(:blank)
  end
end
