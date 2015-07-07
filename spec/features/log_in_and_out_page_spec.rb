require 'rails_helper'

def set_current_user(user = nil)
  visit '/log-in'
  user = FactoryGirl.create :user
  fill_in 'email', :with => user.email
  fill_in 'password', :with => user.password
  click_button "Log in"
  user
end

describe 'the Log in path' do
  it 'clicks log in' do
    visit '/'
    click_link 'Log In'
    expect(page).to have_content 'Log In:'
  end

  it 'authenticates and logs in the user' do
    set_current_user
    expect(page).to have_content "logged in!"
  end

  it 'alerts you and redirects to login page when cant authorize' do
    user = FactoryGirl.create :user
    visit '/log-in'
    fill_in 'email', :with => user.email
    fill_in 'password', :with => "51654"
    click_button 'Log in'
    expect(page).to have_content "problem"
  end

end

describe 'the log out path' do
  it 'logs a user out of their account' do
    set_current_user
    click_link 'Log Out'
    expect(page).to have_content "logged out."
  end
end
