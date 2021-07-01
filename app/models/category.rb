class Category < ApplicationRecord

  has_many :article_categories
  has_many :articles, through: :article_categories

  validates :cat_name, presence: true, length: {minimum: 5, maximum: 25}
  validates_uniqueness_of :cat_name, :message => '%{value} has already been taken'



  HUMANIZED_COLUMNS = {:cat_name => 'Category name'}

  def self.human_attribute_name(attribute, options = {})
    HUMANIZED_COLUMNS[attribute.to_sym] || super
  end

  Category.human_attribute_name("cat_name")
end
