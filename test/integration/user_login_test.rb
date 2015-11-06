require 'test_helper'
class UserLoginTest < ActionDispatch::IntegrationTest

  test 'existing user can log in' do
    user = User.create(username: "slota",
                       password: 'imwild')

    visit login_path

    fill_in 'Username', with: "slota"
    fill_in "Password", with: 'imwild'

    click_button 'Login'
    assert page.has_content?("welcome")
  end

  test 'cannot login without username and password' do
    visit login_path

    fill_in 'Username', with: "slota"
    fill_in "Password", with: 'imwild'

    click_button 'Login'
    save_and_open_page
    assert page.has_content?("Please enter correct username and password")
    assert page.has_content?('Login')
  end

end
