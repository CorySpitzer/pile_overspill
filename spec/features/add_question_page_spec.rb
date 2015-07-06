require 'rails_helper'

describe 'the Log in path' do
  it 'clicks log in' do
    visit '/'
    click_link 'Log In'
    expect(page).to have_content 'Log In:'
  end
end

# describe 'adding a question' do
#   it 'adds a question' do
#     visit '/'
#   end
# end
