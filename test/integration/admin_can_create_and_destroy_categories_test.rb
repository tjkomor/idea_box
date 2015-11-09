require 'test_helper'
require 'mocha/mini_test'

class AdminCategoriesTest < ActionDispatch::IntegrationTest

  test "the admin can create categories" do
    admin = User.create(username: 'boss',
                         password: 'rickross',
                         role: 1)

    ApplicationController.any_instance.stubs(:current_user).returns(admin)

    visit '/login'

    fill_in 'Username', with: "boss"
    fill_in "Password", with: 'rickross'

    click_button 'Login'
    assert page.has_content?("Categories")
    assert page.has_content?("Add Category")

    click_link 'Add Category'

    fill_in 'Name', with: "school"

    click_button 'Create Category'

    assert page.has_content?("school")
    click_link "Delete Category"

    refute page.has_content?('school')

    click_link 'Add Category'

    fill_in 'Name', with: "editboy"

    click_button 'Create Category'

    assert page.has_content?("editboy")
    click_link "Edit Category"

    fill_in 'Name', with: "editboywithbroncos"
    click_button "Update Category"

    save_and_open_page

    assert page.has_content?("editboywithbroncos")
  end

end
