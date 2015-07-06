require 'rails_helper'

describe User do
  it { should validate_presence_of :name }
  # it { should have_secure_password }
  it { should validate_presence_of :password }
  it { should validate_confirmation_of :password }
  # it { should :encrypt_password before_save }
  # it { should have_many :posts }

  it 'encrypts a password' do
    user = FactoryGirl.create :user
    user.encrypt_password
    expect(user.password_salt.length).to be > 0
  end
end
