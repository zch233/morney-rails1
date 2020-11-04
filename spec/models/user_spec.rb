require 'rails_helper'

RSpec.describe User, type: :model do
  it '可以带密码创建' do
    user = User.create email: '1@qq.com', password: '123456', password_confirmation: '123456'
    expect(user.password_digest).to_not eq '123456'
    expect(user.id).to be_a Numeric
  end
  # it 'user 可以被删除' do
  #   user = User.create email: '1@qq.com', password: '123456', password_confirmation: '123456'
  #   expect {
  #     User.destroy user.id
  #   }.to change { User.count }.by(-1)
  # end
  it '创建时必须要填邮箱' do
    user = User.create password: '123456', password_confirmation: '123456'
    expect(user.errors.details[:email][0][:error]).to eq(:blank)
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
end
