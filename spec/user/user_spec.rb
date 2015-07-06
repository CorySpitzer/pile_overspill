require 'rails_helper'

describe User do
  it { should validate_presence_of :name }
  # it { should have_secure_password }
  it { should validate_presence_of :password }
  it { should validate_confirmation_of :password }
  # it { should :encrypt_password before_save }
  it { should have_many :questions }
  it { should have_many :answers }
  # it { should have_many :comments }

  it 'encrypts a password' do
    user = FactoryGirl.create :user
    user.encrypt_password
    expect(user.password_salt.length).to be > 0
  end

  it 'does not authenticate user with incorrect email' do
    user = FactoryGirl.create :user
    expect(User.authenticate("abc@abc.com", "123")).to eq nil
  end

  it 'does not authenticates a user with incorrect password' do
    user = FactoryGirl.create :user
    expect(User.authenticate("sam@gmail.com", "124")).to eq nil
  end

  it 'does not authenticates a user with incorrect password and incorrect email' do
    user = FactoryGirl.create :user
    expect(User.authenticate("sammmm@gmail.com", "124555")).to eq nil
  end

  it 'authenticates a user upon login' do
    user = FactoryGirl.create :user
    expect(User.authenticate("sam@gmail.com", "123")).to eq user
  end

end
