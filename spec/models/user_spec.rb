require 'rails_helper'

RSpec.describe User, type: :model do
  it '可以带密码创建' do
    user = User.create email: '1@qq.com', password: '123456', password_confirmation: '123456'
    expect(user.password_digest).to_not eq '123456'
    expect(user.id).to be_a Numeric
  end
  # it 'user 可以被删除' do # 不是自己写的功能不需要测试
  #   user = User.create email: '1@qq.com', password: '123456', password_confirmation: '123456'
  #   expect {
  #     User.destroy user.id
  #   }.to change { User.count }.by(-1)
  # end
  it '创建时必须要填邮箱' do
    user = User.create password: '123456', password_confirmation: '123456'
    expect(user.errors.details[:email][0][:error]).to eq(:blank)
  end
  it '创建时必须要填邮箱-为空也不行' do
    user = User.create email: '', password: '123456', password_confirmation: '123456'
    expect(user.errors.details[:email][0][:error]).to eq(:blank)
  end
  it '创建时邮箱要符合格式' do
    user = User.create email: '1111', password: '123456', password_confirmation: '123456'
    expect(user.errors.details[:email][0][:error]).to eq(:invalid)
  end
  it '创建时必须要填密码' do
    user = User.create email: '1@qq.com', password_confirmation: '123456'
    expect(user.errors.details[:password][0][:error]).to eq(:blank)
  end
  it '创建时密码要符合格式' do
    user = User.create email: '1@qq.com', password: '111', password_confirmation: '123456'
    expect(user.errors.details[:password][0][:error]).to eq(:too_short)
  end
  it '创建时必须要填确认密码' do
    user = User.create email: '1@qq.com', password: '123456'
    expect(user.errors.details[:password_confirmation][0][:error]).to eq(:blank)
  end
  it '创建时邮箱不能重复' do
    User.create! email: '1@qq.com', password: '123456', password_confirmation: '123456'
    user = User.create email: '1@qq.com', password: '123456', password_confirmation: '123456'
    expect(user.errors.details[:email][0][:error]).to eq(:taken)
  end
  it '创建以后会发送邮件给用户' do
    mailer = spy('Mailer')
    allow(UserMailer).to receive(:welcome_email).and_return(mailer)
    User.create! email: '1@qq.com', password: '123456', password_confirmation: '123456'
    expect(UserMailer).to have_received(:welcome_email)
    expect(mailer).to have_received(:deliver_later)
  end
  it '邮箱为空字符串时，只提示邮箱为空' do
    user = User.create email: ''
    expect(user.errors.details[:email][0][:error]).to eq(:blank)
    expect(user.errors.details[:email].length).to eq(1)
  end
end
