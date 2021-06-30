require "test_helper"

class ListCategoriesTest < ActionDispatch::IntegrationTest

  def setup
    @category = Category.create(cat_name: "Sports")
    @category2 = Category.create(cat_name: "Travel")

  end

  test "should show categories listing" do
    get '/categories'
    assert_select "a[href=?]", category_path(@category), text: @category.cat_name
    assert_select "a[href=?]", category_path(@category2), text: @category2.cat_name
  end
end
