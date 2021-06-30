require 'test_helper'

class CategoryTest < ActiveSupport::TestCase

  def setup
    @category = Category.new(cat_name: "Sports")
  end

  test "category should be valid" do
    assert @category.valid?
  end

  test "cat_name should be present" do
    @category.cat_name = " "
    assert_not @category.valid?
  end

  test "cat_name should be unique" do
    @category.save
    @category2 = Category.new(cat_name: 'Sports')
    assert_not @category2.valid?
  end

  test "cat_name sould not be too long" do
    @category.cat_name = 'a'*26
    assert_not @category.valid?
  end

  test "cat_name sould not be too short" do
    @category.cat_name = 'abc'
    assert_not @category.valid?
  end

end
