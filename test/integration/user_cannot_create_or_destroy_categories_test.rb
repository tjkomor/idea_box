class UserCategories < ActionDispatch::IntegrationTest

  test "user cannot create or delete category" do
    user = User.create(username: "slota",
                       password: 'imwild',
                       role: 0)

    visit login_path

    fill_in 'Username', with: "slota"
    fill_in "Password", with: 'imwild'

    click_button 'Login'


    refute page.has_content?("Add Category")
    refute page.has_content?("Delete Category")
  end


end
