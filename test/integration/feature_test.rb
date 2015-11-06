require 'test_helper'

class FeatureTest < ActionDispatch::IntegrationTest

  test "user can do all of the things" do
    user = User.create(username: "thelegend",
                       password: 'keepslotawild')

    idea = Idea.create(name: 'keep slota wild',
                       description: 'do it')

    visit login_path

    fill_in 'Username', with: 'thelegend'
    fill_in 'Password', with: 'keepslotawild'
    click_on 'Login'

    assert page.has_content?('idea 1')
    assert page.has_content?('welcome')

    click_link 'idea 1'

    assert page.has_content?("be sure to keep slota wild")

    click_link 'delete'

    assert page.has_content('idea 2')
    refute page.has_content('idea 1')
  end

end
