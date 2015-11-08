require 'test_helper'

class FeatureTest < ActionDispatch::IntegrationTest

  test "user can do all of the things" do
    user = User.create(username: "thelegend",
                       password: 'keepslotawild')

    idea = Idea.create(name: 'keep slota wild',
                       description: 'do it')


    idea_2 = Idea.create(name: 'idea 2',
                        description: 'do it')
    visit login_path

    fill_in 'Username', with: 'thelegend'
    fill_in 'Password', with: 'keepslotawild'
    click_on 'Login'

    assert page.has_content?('keep slota wild')
    assert page.has_content?('welcome')

    save_and_open_page

    click_link 'keep slota wild'

    assert page.has_content?("be sure to keep slota wild")
    click_link 'Delete'

    assert page.has_content?('idea 2')
    refute page.has_content?('keep slota wild')
  end

end
