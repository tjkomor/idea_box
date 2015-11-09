require 'test_helper'

class CategoriesTest < ActionDispatch::IntegrationTest

  test "ideas belong to a category" do
    user = User.create(username: "username",
                       password: 'password')

    category = Category.create(name: "category")

    idea = Idea.create(name: 'ideaname',
                       description: 'description',
                       user_id: user.id,
                       category_id: category.id)


    idea_2 = Idea.create(name: 'ideaname2',
                        description: 'description2',
                        user_id: user.id,
                        category_id: category.id)

    visit login_path

    fill_in 'Username', with: 'username'
    fill_in 'Password', with: 'password'
    click_on 'Login'
    assert page.has_content?('username')
    assert page.has_content?('Welcome')

    click_link 'category'

    assert page.has_content?("ideaname")
    assert page.has_content?("ideaname2")

  end

end
