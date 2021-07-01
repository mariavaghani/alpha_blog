require "test_helper"

class NewArticleCreateTest < ActionDispatch::IntegrationTest

  setup do
    @user = User.create(username: "johndoe", email: "johndoe@gmail.com",
                              password: "password")
    sign_in_as(@user)
  end

  test "get new article form and create article" do

    get "/articles/new"
    assert_response :success
    assert_difference "Article.count", 1 do
      post articles_path, params: { article: { title: "Creating Article",
                                    description: "We are trying to create articles here. I hope enough characters",
                                    category_ids: [Category.first, Category.last] } }
      assert_response :redirect
    end
    follow_redirect!
    assert_response :success
    assert_match "Creating Article", response.body
  end

end
