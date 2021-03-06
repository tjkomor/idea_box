require 'test_helper'

class FeatureTest < ActionDispatch::IntegrationTest

  test "user can do all of the things" do
    user = User.create(username: "username",
                       password: 'password',
                       role: 0)

    category = Category.create(name: "School")

    idea = Idea.create(name: 'ideaname',
                       description: 'description',
                       user_id: user.id,
                       category_id: category.id)


    idea_2 = Idea.create(name: 'number2',
                        description: 'description2',
                        user_id: user.id,
                        category_id: category.id)

    visit login_path

    fill_in 'Username', with: 'username'
    fill_in 'Password', with: 'password'
    click_on 'Login'
    assert page.has_content?('username')
    assert page.has_content?('Welcome')


    click_link 'School'

    assert page.has_content?("ideaname")

    click_link "ideaname"

    assert page.has_content?('description')

    click_link 'Delete'

    assert page.has_content?('number2')
    refute page.has_content?('ideaname')
  end

end
